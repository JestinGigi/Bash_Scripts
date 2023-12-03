#!/bin/bash
#Linux bash
ls -l | awk '
BEGIN {print "File\tOwner"}
{print $9 " " $8}
END {print "- DONE - "}
'
