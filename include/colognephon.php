<?php
/**
* A function for retrieving the Kölner Phonetik value of a string
*
* As described at http://de.wikipedia.org/wiki/Kölner_Phonetik
* Based on Hans Joachim Postel: Die Kölner Phonetik.
* Ein Verfahren zur Identifizierung von Personennamen auf der
* Grundlage der Gestaltanalyse.
* in: IBM-Nachrichten, 19. Jahrgang, 1969, S. 925-931
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* @package phonetics
* @version 1.0
* @link http://www.einfachmarke.de
* @license GPL 3.0 <http://www.gnu.org/licenses/>
* @copyright  2008 by einfachmarke.de
* @author Nicolas Zimmer <nicolas dot zimmer at einfachmarke.de>
*/

header('Content-Type: text/html; charset=UTF8');

function cologne_phon($word) {
    /**
     * @param  string  $word string to be analyzed
     * @return string  $value represents the Kölner Phonetik value
     * @access public
     */
    
    // prepare for processing
    $word = strtolower($word);
    $substitution = array(
        "ä"=>"a",
        "ö"=>"o",
        "ü"=>"u",
        "ß"=>"ss",
        "ph"=>"f"
    );
 
    foreach ($substitution as $letter => $substitution) {
        $word = str_replace($letter,$substitution,$word);
    }
 
    $len = strlen($word);
 
    // Rule for exeptions
    $exceptionsLeading = array(
        4 => array("ca","ch","ck","cl","co","cq","cu","cx"),
        8 => array("dc","ds","dz","tc","ts","tz")
    );
 
    $exceptionsFollowing = array("sc","zc","cx","kx","qx");
 
    //Table for coding
    $codingTable = array(
        0  => array("a", "e", "i", "j", "o", "u", "y"),
        1  => array("b", "p"),
        2  => array("d", "t"),
        3  => array("f", "v", "w"),
        4  => array("c", "g", "k", "q"),
        48 => array("x"),
        5  => array("l"),
        6  => array("m", "n"),
        7  => array("r"),
        8  => array("c", "s", "z"),
    );
 
    for ($i=0; $i<$len; $i++) {
        $value[$i] = "";
 
        //Exceptions
        if ($i == 0 && $word[$i].$word[$i+1] == "cr") {
            $value[$i] = 4;
        }
 
        foreach ($exceptionsLeading as $code => $letters) {
            if (in_array($word[$i].$word[$i+1], $letters)) {
                $value[$i] = $code;
            }
        }
 
        if ($i != 0 && (in_array($word[$i-1].$word[$i], $exceptionsFollowing))) {
            $value[$i] = 8;
        }
 
        // normal encoding
        if ($value[$i] == "") {
            foreach ($codingTable as $code => $letters) {
                if (in_array($word[$i], $letters)) {
                    $value[$i] = $code;
                }
            }
        }
    }
 
    // delete double values
    $len = count($value);
 
    for ($i=1; $i<$len; $i++) {
        if ($value[$i] == $value[$i-1]) {
            $value[$i] = "";
        }
    }
 
    // delete vocals
    for ($i=1; $i>$len; $i++) {
        // omitting first characer code and h
        if ($value[$i] == 0) {
            $value[$i] = "";
        }
    }
    
    $value = array_filter($value);
    $value = implode("", $value);
 
    return $value;
}
?>
