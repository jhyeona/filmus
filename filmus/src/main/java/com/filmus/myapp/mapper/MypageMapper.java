package com.filmus.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.filmus.myapp.domain.ActivityVO;
import com.filmus.myapp.domain.CriteriaActivity;
import com.filmus.myapp.domain.CriteriaFilm;
import com.filmus.myapp.domain.CriteriaFollow;
import com.filmus.myapp.domain.CriteriaGuestbook;
import com.filmus.myapp.domain.CriteriaMain;
import com.filmus.myapp.domain.CriteriaReview;
import com.filmus.myapp.domain.FilmReactionVO;
import com.filmus.myapp.domain.FolloweeVO;
import com.filmus.myapp.domain.FollowerVO;
import com.filmus.myapp.domain.GuestbookVO;
import com.filmus.myapp.domain.LikedReviewVO;
import com.filmus.myapp.domain.MainFilmVO;
import com.filmus.myapp.domain.MainGuestbookVO;
import com.filmus.myapp.domain.MainReviewVO;
import com.filmus.myapp.domain.MainUserVO;
import com.filmus.myapp.domain.MypageReviewVO;


public interface MypageMapper {
	
	public abstract MainUserVO getMainUser(CriteriaMain cri);
	
	public abstract int getTotalCountMainFollowers(CriteriaMain cri);
	
	public abstract int getTotalCountMainFollowees(CriteriaMain cri);
	
	public abstract int getTotalCountMainFilms(CriteriaMain cri);
	
	public abstract int getTotalCountMainReviews(CriteriaMain cri);
	
	public abstract List<MainFilmVO> getMainFilm(CriteriaMain cri);
	
	public abstract List<MainReviewVO> getMainReview(CriteriaMain cri);
	
	public abstract List<MainGuestbookVO> getMainGuestbook(CriteriaMain cri);
	
	public abstract List<ActivityVO> getMainActivity(CriteriaMain cri);
	
	public abstract int deleteMainReview(Integer rno);
	
	public abstract int deleteMainGuestbook(Integer gno);
	
	public abstract int insertGuestbook(MainGuestbookVO guestbook);
	
	public abstract int insertFollow(@Param("userid")Integer follower, @Param("sessionUserid")Integer followee);
	
	public abstract int deleteFollow(@Param("userid")Integer follower, @Param("sessionUserid")Integer followee);
	
	public abstract int isFollowed(@Param("userid")Integer follower, @Param("sessionUserid")Integer followee);
	
	//---------------------------------------------------------------------------------//
	
	public abstract List<FilmReactionVO> getFilmReactionList(CriteriaFilm criFilm);
	
	public abstract int deleteFilmReaction(@Param("userid")Integer userid, @Param("filmid")Integer filmid, @Param("code")Integer code);
	
	public abstract List<FollowerVO> getFollowerList(CriteriaFollow criF);
	
	public abstract int cancelFollower(@Param("follower")Integer follower, @Param("followee")Integer followee);
	
	public abstract List<FolloweeVO> getFolloweeList(CriteriaFollow criF);
	
	public abstract List<GuestbookVO> getGuestbookList(CriteriaGuestbook criG);
	
	public abstract int deleteGuestbook(Integer gno);
	
	public abstract List<MypageReviewVO> getMyReviewList(CriteriaReview criR);
	
	public abstract int deleteMyReview(Integer rno);
	
	public abstract List<LikedReviewVO> getLikedReviewList(CriteriaReview criR);
	
	public abstract int cancelLikedReview(@Param("rno")Integer rno, @Param("userid")Integer userid);
	
	public abstract List<ActivityVO> getActivityList(CriteriaActivity criA);
	
	public abstract int getTotalCountReactions(CriteriaFilm criFilm);
	
	public abstract int getTotalCountFollowers(CriteriaFollow criF);
	
	public abstract int getTotalCountFollowees(CriteriaFollow criF);
	
	public abstract int getTotalCountGuestbooks(CriteriaGuestbook criG);
	
	public abstract int getTotalCountMyReviews(CriteriaReview criR);
	
	public abstract int getTotalCountLikedReviews(CriteriaReview criR);
	
	public abstract int getTotalCountActivity(CriteriaActivity criA);
	
	//---------------------------------------------------------------------------------//
	
	public abstract int updateUserProfilePhoto(@Param("fileName")String fileName, @Param("profileText")String profileText, @Param("nickname")String nickname, @Param("userid")Integer userid);
	
	public abstract int updateUserProfile(@Param("profileText")String profileText, @Param("nickname")String nickname, @Param("userid")Integer userid);

} //end interface