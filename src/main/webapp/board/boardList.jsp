<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-22
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>



<style>
    #boardUrl {
        width: 100%;
        height: 50vh;
        background: #0dcaf0;
    }
</style>
<div id = "boardUrl">


</div>

<script>
    $(function () {

    let boardList = $(function (){
        let html = '';


        html += '<table id="list_table">';
        html += '<tr>';

        html += '<td>' + "안녕하십니까 여러분";
        html += '</td>'


        html += '</tr>';
        html += '</table>';


        $("#boardUrl").append(html);
    })
    })

</script>


