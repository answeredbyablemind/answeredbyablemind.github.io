function drawAxis() {
     strokeWeight(1);

      translate(40, 10)
     // dashed-line으로 grid 만들어주기
     drawingContext.setLineDash([0.5, 3]); // 점선 효과 주기
     for (let i = 0; i < n_xlabel; i++) {
          line(i * scl, 0, i * scl, scl * (n_ylabel - 1));
     }
     for (let i = 0; i < n_ylabel; i++) {
          line(0, i * scl, scl * (n_xlabel - 1), i * scl);
     }

      // x, y축 그려주기
     drawingContext.setLineDash([1, 1]); // 점선 효과 종료
     strokeWeight(2)
     line(1, n_ylabel * scl - scl, n_xlabel * scl - scl, n_ylabel * scl - scl) // x축
     line(1, 1, 1, n_ylabel * scl - scl) // y축

      // y 축에 글자 써주기
     translate(0, 0);
     textAlign(RIGHT)
     for (let i = 0; i < floor((height - 20) / scl); i++) {
          text(ylabel[i], -5, i * scl + 5)
     }
     // x 축에 글자 써주기
     for (let i = 0; i < floor((width - 20) / scl); i++) {
          text(xlabel[i], i * scl + 5, height - 40 - 5)
     }

     scale(1,-1)
     translate(0+1,-6*scl)

}
