$(document).ready(function(){

	var userNum = $("#userNum"),            //获取用户名输入栏
		passNum = $("#passwordNum"),        //获取密码输入栏
		userReset = $(".user-reset"),       //获取用户名重置按钮
		passReset = $(".password-reset"),   //获取密码重置按钮
		click = $(".click"),                //获取点击按钮
		loginBtn = $(".loginBtn"),          //获取登陆按钮
		loginWin = $(".login"),             //获取登录窗口
		word = $(".word"),                  //获取提示条
		close = $(".title span");           //获取关闭按钮

	// 重新加载页面后所有样式初始化
	userNum.val('');
	passNum.val('');
	userReset.css('display','none');
	passReset.css('display','none');
	word.text('');
	
	//输入时清除按钮出现
	userNum.on('input propertychange',function(){

		if($(this).val()){
			userReset.css('display','inline-block');
		}else{
			userReset.css('display','none');
		}
	})
	passNum.on('input propertychange',function(){

		if($(this).val()){
			passReset.css('display','inline-block');
		}else{
			passReset.css('display','none');
		}
	})

	//点击清除按钮重置值
	userReset.on('click',function(){

		userNum.val("");
		$(this).css('display','none');
	})
	passReset.on('click',function(){

		passNum.val("");
		$(this).css('display','none');
	})

	//聚焦时边框高亮
	function light(el1,el2){

		$(el1).on('focus',function(){
			$(el2).addClass('boxShadow');
		}).on('blur',function(){
			$(el2).removeClass('boxShadow');
		})
	}
	light("#userNum",".user");
	light("#passwordNum",".password");

	//点击登录时判断是否输入值，并弹出对话框
	loginBtn.on('click',function(){

		if(userNum.val()==='' && passNum.val() ===''){
			word.text('请输入用户名和密码。');
		}else if(userNum.val()===''){
			word.text('请输入用户名。');
		}else if(passNum.val() ===''){
			word.text('请输入密码。');
		}else{
			word.text('');
		 	alert("你还没有注册，不能登录！");
		 	loginWin.css('display','none');
		 	//样式初始化
		 	userNum.val('');
			passNum.val('');
			userReset.css('display','none');
			passReset.css('display','none');
			word.text('');
		}
	})

	//点击按钮弹出登陆框
	click.on('click',function(){

		$(".login").css('display','block');
	})
	//点击关闭按钮关闭登陆框
	close.on('click',function(){

		$(".login").css('display','none');
		//所有样式初始化
		userNum.val('');
		passNum.val('');
		userReset.css('display','none');
		passReset.css('display','none');
		word.text('');
	})
})