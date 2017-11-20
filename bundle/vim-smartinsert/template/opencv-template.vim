template |cv2-imread|
cv2.imread('____')
endtemplate

template |cv2-imshow|
cv2.imshow('____',____)
endtemplate

template |cv2-waitkey|
cv2.waitKey(0)
endtemplate

template |cv2-destropyAllWindows|
cv2.destroyAllWindows()
endtemplate

template |cv2-imwrite|
cv2.imwrite('____', ____)
endtemplate

template |cv2-cvtColor-Gray|
cv2.cvtColor(____,cv2.COLOR_BGR2GRAY)
endtemplate

template |cv2-cvtColor-HSC|
cv2.cvtColor(____,cv2.COLOR_BGR2HSV)
endtemplate

template |cv2-cvtColor|
cv2.cvtColor(____,____)
endtemplate

template |cv2-split|
cv2.split(____)
endtemplate

template |cv2-merge|
cv2.merge(____) 
endtemplate

template |np-zeros|
np.zeros(____,dtype="uint____")
endtemplate

template |cv2-calcHist|
cv2.calcHist($:image____,$:channels____,$:mask____,$histSize:____,$:ranges____)
endtemplate

template |plt-hist|
plt.hist($flattened_iamge:____,$hist_size:____,$range:____)
endtemplate

template |cv2-line|
cv2.line($:image____, $:start____, $:end____, $:color____, $:thickness____)
endtemplate

template |cv2-wait_and_destroy|
cv2.waitKey(0)
cv2.destroyAllWindows()
endtemplate

template |cv2-rectangle|
cv2.rectangle($:image____,$:start____,$:opposite____,$:color____,$:thickness____)
endtemplate

template |cv2-ellipse|
cv2.ellipse($ellipse:____,$center:____,$axes:____,$angle:____,$start_angle:____,$end_angle:____,$color:____,$thickness:____)
endtemplate

template |cv2-circle|
cv2.circle($image:____, $center:____, $radius:____, $color:____, $fill:____) 
endtemplate

template |cv2-polylines|
cv2.polylines($image:____,[$points:____],$is_closed:____,$color:____,$thickness:____)
endtemplate

template |cv2-putText|
cv2.putText(
				$image:____,
				$text:____,
				$bottom_left_start:____,
				$Font:____,
				$FontSize:____,
				$color:____,
				$thickness:____,
)
endtemplate

template |cv2-filter2D|
cv2.filter2D($image:____, $depth:____, $kernel:____)
endtemplate

template |cv2-threshold|
cv2.threshold($image:____,$threshold:____,$otherwise:____,$method:____)
endtemplate

template |cv2-GaussianBlur|
cv2.GaussianBlur($image:____,($width:____,$height:____),$deviation:____)
endtemplate

template |cv2-adaptiveThreshold|
cv2.adaptiveThreshold(
    $image:____,
    $threshold:____,
    $method:____,
    $threshold_type:____,
    $block_size:____,
    $constant:____
)
endtemplate

template |cv2-erode|
cv2.erode($image:____, $kernel:____, iterations = ____)
endtemplate

template |cv2-dilate|
cv2.dilate($image:____, $kernel:____, iterations = ____)
endtemplate

template |cv2-morphologyEx|
cv2.morphologyEx($image:____, $MORPH:____, $kernel:____)
endtemplate

template |cv2-Sobel|
cv2.Sobel($image:____,cv2.CV_64F,____,____,ksize=____)
endtemplate

template |cv2-bitwise_or|
cv2.bitwise_or(____,____)
endtemplate

template |cv2-bitwise_and|
cv2.bitwise_and(____,____)
endtemplate

template |cv2-bitwise_not|
cv2.bitwise_not(____,____)
endtemplate

template |cv2-Canny|
cv2.Canny($image:____,____,____)
endtemplate

template |cv2-getPerspectiveTransform|
cv2.getPerspectiveTransform($corner_1:____, $corner_2:____)
endtemplate

template |cv2-warpPerspective|
cv2.warpPerspective($image:____, ____, ____)
endtemplate

template |cv2-getAffineTransform|
cv2.getAffineTransform($corner_1:____,$corner_2:____)
endtemplate

template |cv2-warpAffine|
cv2.warpAffine($image:____,$trans_matrix:____,($cols:____,$rows:____))
endtemplate

template |cv2-getRotationMatrix2D|
cv2.getRotationMatrix2D(($center-x:____,$center-y:____),$angle:____,$scale:____)
endtemplate

template |cv2-transpose|
cv2.transpose($image:____)
endtemplate

template |cv2-flip|
cv2.flip($image:____,____)
endtemplate

template |cv2-resize|
cv2.resize($image:____, $out_img_size:____, fx=$x-scale:____, fy=$y-scale:____, interpolation=$interpolation:____)
endtemplate

template |cv2-pyrDown|
cv2.pyrDown($image:____)
endtemplate

template |cv2-pyrUp|
cv2.pyrUp($image:____)
endtemplate

template |cv2-add|
cv2.add($image:____,$add_matrix:____)
endtemplate

template |cv2-subtract|
cv2.subtract($image:____,$add_matrix:____)
endtemplate

template |cv2-bilateralFilter|
cv2.bilateralFilter($image:____,$color:____,$space:____,$border:____)
endtemplate

template |cv2-fastNlMeansDenoisingColored|
cv2.fastNlMeansDenoisingColored($image:____,None,$strenght:____,$color:____,$template_size:____,$search_size:____)
endtemplate

template |cv2-findContours|
cv2.findContours($image:____,____,____)
endtemplate

template |cv2-drawContours|
cv2.drawContours($image:____,$contours:____,____,$color:____,____)
endtemplate

template |cv2-coutourArea|
cv2.contourArea($contour:____)
endtemplate

template |cv2-moments|
cv2.moments($contour:____)
endtemplate

template |cv2-boundingRect|
cv2.boundingRect(____)
endtemplate

template |cv2-arcLength|
cv2.arcLength($contour:____,$bool:____)
endtemplate

template |cv2-approxPolyDP|
cv2.approxPolyDP($contour:____,$accuracy:____,$bool:____)
endtemplate

template |cv2-convexHull|
cv2.convexHull($contour:____)
endtemplate

template |cv2-matchShape|
cv2.matchShapes($template:____,$target:____,____,____)
endtemplate
