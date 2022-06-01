<?php

/** The name of the database for WordPress */
define( 'DB_NAME', '$MYSQL_DATABASE' );

/** MySQL database username */
define( 'DB_USER', '$MYSQL_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );

/** MySQL hostname */
define( 'DB_HOST', '$DB_HOST' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );


define('AUTH_KEY',         '.m;jF|T(I|-Ja-qF- ~lOX3}R|yXT@-<@hTWqS6}+NQ7_| +6y-`+I)C5/(LHJ2~');
define('SECURE_AUTH_KEY',  'fqWFTQ>6WsPA~M,N|D|tV=-D_<ly2%|9/.{A*q-{HE&v+h@[1R*w$~::=C/1@cu#');
define('LOGGED_IN_KEY',    '`+[)kE+D/v9rj~iJ~Wg`Dt4V3sI+#/Az/7/=E1ngL^T9, -iR%PV^lTPtAWjN{%{');
define('NONCE_KEY',        'UvJ;d#IGK@d#{1rk&T~7#.x<xn{8H1iSY-4+4Z|TQ:cHIeTQ,slqY9p0hbUR*,B;');
define('AUTH_SALT',        'j1}%0,I6N~Y-;M!FY>sF}znyC%foKrMaJ Pu6Q&_;ixR3bay_6xpEiaTU9-o($}E');
define('SECURE_AUTH_SALT', 'd?kk!t>j}Qi4kc/U)LA@x*fy, -k}<= 1eTy!0O]3<Vt^=e 0,Ah%Nm*3]vy$9/m');
define('LOGGED_IN_SALT',   's=&ZaEdsxfF_Xp3S)sSs{|^&iNg.5>D)#{^g|Je,|.*A?8rQn$u@aE~#*F&HdcFM');
define('NONCE_SALT',       'TRb&.1%<w.}#3M-/i@iqihTl*9=SQ=tVjXt?j /PUo;vJMN h[3`#:B$-q9Ni<N|');


$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

define( 'WP_DEBUG_LOG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php'; 