#!/bin/bash

modules=(                             
				"List::MoreUtils"                   
				"List::Flatten"                     
				"File::Slurp"                       
				'Math::MatrixReal --force'       
				"Ref::Util"                        
				"Math::Random::NormalDistribution" 
				"MCE::Loop"                        
)

for each_module in "${modules[@]}"
do
				echo $each_module
				cpanm $each_module
done

