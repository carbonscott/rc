#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';

#######################
# 0. Create Header File
#######################

#========================================
# Create a header file named by classname
#========================================

my ($ClassName) = @ARGV;
open my $HeadFile, '>',$ClassName.'.h' if defined $ClassName;
die "Failed to create file!" unless defined $HeadFile;

#=========================
# Class Declaration Macros
#=========================

print {$HeadFile} "#ifndef ".(uc $ClassName)."_H\n";
print {$HeadFile} "#define ".(uc $ClassName)."_H\n";
print {$HeadFile} "\n";
print {$HeadFile} "class ".$ClassName." {\n";
print {$HeadFile} "public: \n";
print {$HeadFile} "    "."explicit ".$ClassName."();\n";
print {$HeadFile} "    ".$ClassName."(const ".$ClassName."&);\n";
print {$HeadFile} "    "."~".$ClassName."();\n";
print {$HeadFile} "    ".$ClassName."& "."operator=(const ".$ClassName."&);\n";
print {$HeadFile} "private: \n";
print {$HeadFile} "};\n";
print {$HeadFile} "#endif\n";

close $HeadFile;


#######################
# 1. Create Source File
#######################

open my $SourceFile, '>',$ClassName.'.cpp' if defined $ClassName;
die "Failed to create source file!" unless defined $SourceFile;

print {$SourceFile} "#include \"".$ClassName.".h\"\n\n";
print {$SourceFile} $ClassName."::".$ClassName."() {\n    \n}\n\n";
print {$SourceFile} $ClassName."::".$ClassName."(const ".$ClassName."&) {\n    \n}\n\n";
print {$SourceFile} $ClassName."::"."~".$ClassName."() {\n    \n}\n\n";
print {$SourceFile} $ClassName."& ".$ClassName."::"."operator=(const ".$ClassName."&) {\n    \n    return *this;\n}\n\n";



close $SourceFile;
