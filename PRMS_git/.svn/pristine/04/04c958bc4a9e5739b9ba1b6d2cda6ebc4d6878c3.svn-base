$(document).ready(function() {
	  var options = {
          series: [{
          data: [44, 55, 41, 64, 22, 43, 21,10, 20]
        }, {
          data: [53, 32, 33, 52, 13, 44, 32,20 ,10]
        }],
          chart: {
          type: 'bar',
          height: 430
        },
        plotOptions: {
          bar: {
            horizontal: true,
            dataLabels: {
              position: 'top',
            },
          }
        },
        dataLabels: {
          enabled: true,
          offsetX: -6,
          style: {
            fontSize: '12px',
            colors: ['#fff']
          }
        },
        stroke: {
          show: true,
          width: 1,
          colors: ['#fff']
        },
        tooltip: {
          shared: true,
          intersect: false
        },
        xaxis: {
          categories: ['사료', '간식', '옷', '하네스', '배변패드', '샴푸', '장난감', '운동기구', '케이지'],
        },
        };

        var chart = new ApexCharts(document.querySelector("#chart"), options);
        chart.render();
      
      
    
});