
"#a: ?> [1,6] can be got;
"#a: $ln_last:=$init; 
"#a: $ln_last,$term:-search->$ln_matched; # $ln_matched:-eval->7
"#a: $ln_matched==0=>  # program stops;
"#a: $ln_matched-$ln_last==2 => {
"#a: 	false=>{
"#a: 		$ln_last,$ln_matched:-record-:[1,6]; # input:-?&proc->[1,6]; &proc:={return [$ln_last,$ln_matched-1]}
"#a: 	};
"#a: 	true=># do nothing;
"#a: } 
"#a: $ln_last=$ln_matched+1;              # $ln_last:-eval->7; give new position to last line for recording 
"#a: $ln_last,$term:-search->$ln_matched; # 
"#a: $ln_matched==0=>  # program stops;
"#a: $ln_matched-$ln_last==2 :-if-: {    # [7,9]
"#a: 	false=>{
"#a: 		$ln_last,$ln_matched:-record-:[7,9]; # input:-?&proc->[7,9]; &proc:={return [$ln_last,$ln_matched-1]}
"#a: 	};
"#a: 	true=># do nothing;
"#a: } 
"#a: $ln_last=$ln_matched+1;              # $ln_last:-eval->10; give new position to last line for recording 
"#a: $ln_last,$term:-search->$ln_matched; # $ln_matched=0; no more match
"#a: $ln_matched==0=>  # program stops;   # :---------------------- jump --------------------->
"#a: $ln_matched-$ln_last==2 :-if-: {    # [7,9]
"#a: 	false=>{
"#a: 		$ln_last,$ln_matched:-record-:[7,9]; # input:-?&proc->[7,9]; &proc:={return [$ln_last,$ln_matched-1]}
"#a: 	};
"#a: 	true=># do nothing;
"#a: } 



let s:search_term = input("Search for: ")
"#sample: let s:search_term = '\<'.s:search_term.'\>'
"#sample: 
"#sample: let s:search_line_num = search(s:search_term,'nW')
"#sample: echo s:search_line_num

"#t: hello testing      1 
"#t: hello testing      2
"#t: hello testing      3          #  if I searched `testings`, can i get 
"#t: hello testing      4          #  [1,6] lines where searched term is not found
"#t: hello testing      5          #  [10,15] lines where searched term is not found
"#t: hello testing      6          #  ?> [1,6] can be got;
"#t: hello testings     7          #
"#t: hello testing      8          #
"#t: hello testings     9          #
"#t: hello testing      10          #
"#t: hello testing      11         #
"#t: hello testing      12        #
"#t: hello testing      13       #
"#t: hello testing      14
