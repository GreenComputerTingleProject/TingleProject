<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>

<style>
    * { margin: 0px;  padding: 0px;}
    .jumbotron  {
        width:300px; height: 250px; left:50%; top:50%; position:absolute; background: white;
        transform: translate(-50%, -50%);
    }

    h2 {text-align: center; font-size: medium; font-family: 'Play fair '}
    body { background: #f0f0f0;}
    form { width:100%; height:250px; background: white; }
    form>div { margin: 25px;}
    .btn {background-color: mediumslateblue; color: honeydew;}
    .btn:hover { background: indigo; border-color:indigo; color: honeydew;}
</style>
<%--<img class="img-responsive center-block" src="<c:url value="/img/"/>j_8.png" alt="" style="width: 50px; height: 50px;">
--%>
<div id=adminUrl class="jumbotron">
    <form action="AdminLoginReg" method="post">
        <h2 class="nav navbar-text justify-content-center" style="background: darkorchid; color: honeydew;">TINGLE MANAGER</h2>
        <div class="form-group">
            <input type="text" name="login_id" class="form-control" placeholder="USER NAME">
        </div>
        <div class="form-group">
            <input type="password" name="login_pw" class="form-control" placeholder="PASSWORD">
        </div>
        <div class="form-group" style="text-align: center;">
            <input type="submit" value="Login" class="btn btn-sm">
        </div>
    </form>
</div>
</div>

