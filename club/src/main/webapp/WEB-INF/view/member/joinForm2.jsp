<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="reset.css">
    <style>
        .wrap {
            width:1200px;
            margin:0 auto;
        }
        .header {
            height:100px;
            width:100%;
            color:black;
            text-align:center;
            font-size: 60px;
            line-height:100px;
        }
        .menu {
            width:100%;
            height:40px;
            margin: 20px 0 80px 0;
        }
        .menu > ul > li {
            list-style-type: none;
            float:left;
            width:400px;
            text-align:center;
            line-height: 40px;
            border:1px solid #000000;
            box-sizing: border-box;
        }
        .container {
            position: relative;
            width:1200px;
            height: 1000px;
        }
        .container > .content {
            position: absolute;
            width:400px;
            height:1000px;
            text-align: center;
        }
        .content-form {
            margin:10px auto;
            width: 300px;
            height: 100px;
            text-align: center;
            line-height: 20px;
        }
        .footer {
            position: relative;
            overflow: hidden;
            width:100%;
            background-color:#221f1f;
			color:#999;
			padding:20px 0;
        }
        .footer > .size{
        	width:1200px;
        	margin:0 auto;
        }
        .footer > .size > .sns_area{
        	position:absolute;
        	bottom: 10px;
        	right:0;
        }
         .footer > .size > .info > p{
            width:50%;
         	line-height: 22px;
         }
         .footer > .size > .sns_area > a{
         	margin: 10px;
         }
         /* 회원가입 영역 */
         .cf_top, .cf_bottom {
             margin:10px 0;
         }
         .cf_top_title {
             text-align:left;
             font-size:30px;
             font-weight: 800;
         }
         .cf_bottom_left {
             float:left;
             width:70%;
         }
         .cf_bottom_right {
             float:left;
             width:30%;
         }
         .content-form  input[type='text'], .content-form  input[type='password'] {
             height : 24px;
             width:100%;
         }
         .content-form input[type='button'] {
             height:30px;
         }
         .cf_bottom {
            text-align:left;
         }
         
    </style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            회원가입
        </div>    
        <div class="menu">
            <ul>
                <li>약관동의</li>
                <li style="background-color: blanchedalmond;">정보입력</li>
                <li>가입완료</li>
            </ul>
        </div>
        <div class="container">
            <form action="" method="post">
                <div class="content">
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="id">아이디</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <div class="cf_bottom_left">
                                <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요"/>
                            </div>
                            <div class="cf_bottom_right">
                                <input type="button" value="중복체크">
                            </div>
                        </div>
                    </div>
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="password">비밀번호</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해 주세요"/>
                        </div>
                    </div>    
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="password">비밀번호 재확인</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="password" name="password-confirm" id="password-confirm" placeholder="비밀번호를 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="name">이름</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="name" id="name" placeholder="이름을 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="email">메일 주소</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="email" id="email" placeholder="메일 주소를 입력해 주세요"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="password">생년월일</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <select name="user_birth_year">
                                <option value="2000" selected>1990</option>
                                <option value="2000" selected>1991</option>
                                <option value="2000" selected>1992</option>
                                <option value="2000" selected>1993</option>
                                <option value="2000" selected>1994</option>
                                <option value="2000" selected>1995</option>
                                <option value="2001" selected>1996</option>
                                <option value="2002" selected>1997</option>
                                <option value="2003" selected>1998</option>
                                <option value="2004" selected>1999</option>
                                <option value="2000" selected>2000</option>
                                <option value="2001" selected>2001</option>
                                <option value="2002" selected>2002</option>
                                <option value="2003" selected>2003</option>
                                <option value="2004" selected>2004</option>
                            </select>
                            년
                            <select name="user_birth_month">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            월
                            <select name="user_birth_day">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="gender">성별</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="radio" name="gender" value="m"/>
                            <label for="man">남자</label>
                            <input type="radio" name="gender" value="w"/>
                            <label for="woman">여자</label>
                        </div>
                    </div>  
                    <div class="content-form">
                        <div class="cf_top">
                            <div class="cf_top_title">
                                <lable for="password">휴대전화</lable>
                            </div>
                        </div>
                        <div class="cf_bottom">
                            <input type="text" name="password" id="password" placeholder="휴대전화를 입력해 주세요 (숫자만)"/>
                        </div>
                    </div>  
                    <div class="content-form">
                        <input type="submit" value="가입완료">
                    </div>
                </div>
            </form>
        </div>
        <div class="footer">
            <div class="size">
               <div class="info">
                   <p>구디아카데미</p>
                   <p>서울시 서울구 서울로 서울동 서울호</p>
                   <p>02-2000-2000 | 010-2222-2222</p>
                   <p>대표자 김철수 | 책임자 김수철</p>
                   <p>사업자등록번호 111-11-22222</p>
               </div>
               <div class="sns_area">
                   <a href=""><img src="img/facebook.png"></a>
                   <a href=""><img src="img/instar.png"></a>
                   <a href=""><img src="img/blog.png"></a>
               </div>
            </div>
       </div>
    </div>
</body>
</html>