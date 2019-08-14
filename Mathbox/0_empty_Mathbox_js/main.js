var mathbox = mathbox(options);
if (mathbox.fallback) throw "WebGL not supported";

var three = mathbox.tree;

var element = document.querySelector('#my-thing');
var mathbox = mathbox({
  element: element
});

var view = mathbox
  .cartesian({
    range: [
      [-2, 2],
      [-1, 1],
      [-1, 1]
    ],
    scale: [2, 1, 1],
  })
  .axis({
    axis: 1,
  })
  .axis({
    axis: 2,
  })

mathbox
  .select("cartesian > axis")