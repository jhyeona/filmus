package com.filmus.myapp.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;


import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;
import com.filmus.myapp.domain.BoardUserVO;
import com.filmus.myapp.domain.BoardVO;
import com.filmus.myapp.domain.Criteria;
import com.filmus.myapp.domain.FileVO;
import com.filmus.myapp.mapper.BoardMapper;
import com.filmus.myapp.mapper.FileMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class BoardServiceImpl 
	implements BoardService {
	
	@Autowired private BoardMapper mapper;
	@Autowired private FileMapper fmapper; 


	@Override
	public List<BoardUserVO> getList(Criteria cri) {
		log.debug("getList({},{}) invoked.",cri);
		Objects.requireNonNull(this.mapper);
		
		return this.mapper.getList(cri);
	}//getList

	@Override
	public BoardUserVO get(Integer bno) {
		log.debug("get({}) invoked.",bno);
		Objects.requireNonNull(this.mapper);
		this.mapper.viewCnt(bno, 1);
		
		return this.mapper.select(bno);
	}//get

	@Override
	public boolean register(BoardVO board) {
		log.debug("register({},{}) invoked.",board);
		Objects.requireNonNull(mapper);
		Objects.requireNonNull(fmapper);
		
		return (this.mapper.insertSelectKey(board)==1);
	}//register

	@Override
	public boolean modify(BoardVO board) {
		log.debug("modify({}) invoked.",board);
		Objects.requireNonNull(this.mapper);

		return (this.mapper.update(board)==1);
	}//modify

	@Override
	public boolean remove(Integer bno) {
		log.debug("remove({}) invoked.",bno);
		Objects.requireNonNull(this.mapper);

		return (this.mapper.delete(bno)==1);
	}//remove
 
	@Override
	public int getTotal(Criteria cri) { 
		log.debug("getTotal({}) invoked.",cri);
		Objects.requireNonNull(this.mapper);
		Objects.requireNonNull(cri);
		
		return this.mapper.getTotalCount(cri);
	}//getTotal

	//---- FILE ----//
	
	@Override
	public FileVO fileInsert(MultipartFile file, int bnoPlus) {
		log.debug("fileInsert({}) invoked.",file);
		
		Objects.requireNonNull(this.fmapper);
		
		FileVO fileVO = new FileVO();
		
		String uploadPath = "";
        
        String path = "C:/awsTemp/"; // 파일 업로드 경로
            
        String original = file.getOriginalFilename(); // 업로드하는 파일 name 
        uploadPath = path+original; // 파일 업로드 경로 + 파일 이름
              
        try {
            file.transferTo(new File(uploadPath)); // 파일을 위에 지정 경로로 업로드
        } catch (IllegalStateException e) {
            
            e.printStackTrace();
        } catch (IOException e) {
            
            e.printStackTrace();
        } //try-catch
		
		Regions clientRegion = Regions.AP_NORTHEAST_2;
        String bucketName = "younghoon";
        //String stringObjKeyName = "123";			//올린파일설명제목
        String fileName = uploadPath; 	//올릴파일 경로
        String fileNameExtension=FilenameUtils.getExtension(fileName).toLowerCase();
        String destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
        String fileObjKeyName = destinationFileName;				//클라우드에 올라가는 파일 이름
        String mimeType = file.getContentType();
            
        try {

            AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
                    .withRegion(clientRegion)
                    .build();    
          
            PutObjectRequest request = new PutObjectRequest(bucketName, fileObjKeyName, new File(fileName));
            ObjectMetadata metadata = new ObjectMetadata();
            
            metadata.setContentType(metadata.getContentType());
            metadata.addUserMetadata("title", "someTitle");
            request.setMetadata(metadata);
            s3Client.putObject(new PutObjectRequest(bucketName, fileObjKeyName, new File(fileName)));
            
        } catch (AmazonServiceException e) {
         
            e.printStackTrace();
        } catch (SdkClientException e) {
            
            e.printStackTrace();
        } finally {
        	if(uploadPath != null) {
        		File fileLocal = new File(uploadPath);
        		fileLocal.delete();
        	} //if
        } //try-catch-finally
   
		fileVO.setBno(bnoPlus);
		fileVO.setFname(original);
		fileVO.setUuid(destinationFileName);
		fileVO.setPath("test");
		fileVO.setMime(mimeType);
				
		this.fmapper.insert(fileVO);
		
		return fileVO;
	}//fileInsert
	
	@Override
	public FileVO fileDetail(Integer bno) {
		log.debug("fileDetail({}) invoked.", bno);
		Objects.requireNonNull(this.fmapper);
		
		FileVO list = this.fmapper.find(bno);
		
		return list;
	} //fileDetail

	@Override
	public ResponseEntity<byte[]> fileDownload(Integer bno) throws IOException {
		log.debug("fileDetail({}) invoked.", bno);
		Objects.requireNonNull(this.fmapper);
		
		String storedFileName = this.fmapper.find(bno).getUuid();
		String originalFileName = this.fmapper.find(bno).getFname();
		
		Regions clientRegion = Regions.AP_NORTHEAST_2;
        String bucketName = "younghoon";
                
	    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
	            .withRegion(clientRegion)
	            .withCredentials(new ProfileCredentialsProvider())
	            .build();
		
        S3Object o = s3Client.getObject(new GetObjectRequest(bucketName, storedFileName));
        S3ObjectInputStream objectInputStream = o.getObjectContent();
        byte[] bytes = IOUtils.toByteArray(objectInputStream);
        
        String fileName = URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+", "%20");
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        httpHeaders.setContentLength(bytes.length);
        httpHeaders.setContentDispositionFormData("attachment", fileName);
        
        ResponseEntity<byte[]> resEntity = new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
        
        return resEntity;

	} //fileDownload
	
}//end class