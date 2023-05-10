package require openapi 0.4.12
package require parse_args 0.3.2
package require chantricks

namespace import parse_args::*
namespace import chantricks::*

parse_args $argv {
	-ziplet	{-boolean}
	-in		{-required}
	-out	{-required}
}

set extra	{}
if {$ziplet} {lappend extra -ziplet}

writebin $out [openapi generate tm {*}$extra -- [readfile $in]]
