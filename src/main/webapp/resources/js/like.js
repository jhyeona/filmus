console.log(" ** >> Like Module << **");
var likeService = (

    function(){
        
        function likeIt(bno, userid, callback, error){
            console.log(userid+"회원 좋아요 >>"+bno);
            $.ajax({
                type: 'post',
                url: '/board/like/'+bno+'/'+userid,
                success: function(result,status,xhr){
                    if(callback);
                },//success
                error:function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//newHeart

        function unLike(bno,userid,callback,error){
            console.log(userid+"회원 좋아요 취소 >>"+bno);
            $.ajax({
                type: 'post',
                url: '/board/unlike/'+bno+'/'+userid,
                success: function(result,status,xhr){
                    if(callback){
                        callback(result);
                    }//if
                },//success
                error: function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//delHeart

        function likeChecking(data, callback, error){
            console.log("ajax_get");
            $.ajax({
                type:'GET',
                url:'/board/get',
                data:JSON.stringify(reply),
                contentType:"application/json; charset=utf-8",
                success: function(result,status, xhr){
                    if(callback){
                        callback(result);
                    }
                },
                error: function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })
        }//likeCehck

        return{
            likeIt: likeIt,
            unLike: unLike,
            likeChecking: likeChecking
        }
    }//function

)();//likeService