console.log(" >> Reply Module <<");
var replyService = (
	function(){
		function add(reply, callback, error){
			console.log("add(reply, callback) invoked.");
			
			$.ajax({
                type: 'post',
                url: '/board/replies/new',
                data: JSON.stringify(reply),
                contentType: "application/json; charset=utf-8",
                success: function(result,status,xhr){
                    if(callback){
                        callback(result);
                    }
                },
                error:function(xhr,status,er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
		}//add

        function getList(param, callback, error){
            var bno=param.bno;
            var page=param.page || 1;

            $.getJSON("/board/replies/pages/"+bno+"/"+page,
                function(data){
                    if(callback){
                        callback(data);
                    }//if
                }//function
            ).fail(function(xhr,status,err){
                if(error){
                    error();
                }//if
            })//fail
        }//getList

        function remove(bcno, callback, error){
            $.ajax({
                type: 'post',
                url:'/board/replies/'+bcno,
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
            })//ajax
        }//remove

        function update(reply, callback, error){
            console.log("bcno:"+reply.bcno);
            $.ajax({
                type:'put',
                url:'/board/replies/'+reply.bcno,
                data:JSON.stringify(reply),
                contentType:"application/json; charset=utf-8",
                success:function(result,status, er){
                    if(error){
                        callback(result);
                    }//if
                },//success
                error: function(xhr, status, er){
                    if(error){
                        error(er);
                    }//if
                }//error
            })//ajax
        }//update

        function get(bcno, callback, error){
            $.get("/board/replies/"+bcno, function(result){
                if(callback){
                    callback(result);
                }//if
            }).fail(function(xhr,status,err){
                if(error){
                    error();
                }//if
            })//fail
        }//get

        function displayTime(timeValue){
            var today=new Date();
            var gap=today.getTime()-timeValue;
            var dateObj=new Date(timeValue);
            var str="";
            if(gap<(1000*60*60*24)){
                var hh=dateObj.getHours();
                var mi=dateObj.getMinutes();
                var ss=dateObj.getSeconds();

                return[(hh>9? '':'0')+hh,':',(mi>9?'':'0')+mi,':',(ss>9? '':'0')+ss].join('');
            } else {
                var yy=dateObj.getFullYear();
                var mm=dateObj.getMonth()+1;
                var dd=dateObj.getDate();
                return[ yy,'/',(mm>9?'':'0')+mm,'/',(dd>9?'':'0')+dd].join('');
            }//if-else
        }//displayTime

        return{
            add: add,
            getList: getList,
            remove: remove,
            update: update,
            get: get,
            displayTime: displayTime
        }//return
    }//function

)();//replyService