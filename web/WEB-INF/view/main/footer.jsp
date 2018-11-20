<!-- Mainly scripts -->
<script src="<c:url value='/assets/js/jquery-2.1.1.js' />"></script>
<script src="<c:url value='/assets/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/assets/js/jquery.metisMenu.js' />"></script>
<script src="<c:url value='/assets/js/jquery.slimscroll.min.js' />"></script>

<!-- Flot -->
<script src="<c:url value='/assets/js/jquery.flot.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.flot.tooltip.min.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.flot.spline.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.flot.resize.js'/>"></script>
<script src="<c:url value='/assets/js/jquery.flot.pie.js'/>"></script>

<!-- Peity -->
<script src="<c:url value='/assets/js/jquery.peity.min.js'/>"></script>
<script src="<c:url value='/assets/js/peity-demo.js'/>"></script>

<!-- Custom and plugin javascript -->
<script src="<c:url value='/assets/js/inspinia.js'/>"></script>
<script src="<c:url value='/assets/js/pace.min.js'/>"></script>

<!-- Toastr -->
<script src="<c:url value='/assets/js/toastr.min.js'/>"></script>

<!-- ChartJS-->
<script src="<c:url value='/assets/js/Chart.min.js'/>"></script>

<!-- jQuery UI -->
<script src="<c:url value='/assets/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/assets/js/icheck.min.js'/>"></script>
<!-- Data picker -->
<script src="<c:url value='/assets/js/bootstrap-datepicker.js'/>"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });
    });
</script>
