erlc +"'S'"  -o ./ebin_debug ./src/erlpkcs7_transform.erl
erlc -o ./ebin_debug ./src/erlpkcs7_transform.erl
erlc -o ./ebin_debug -pa ./ebin_debug +'{parse_transform, erlpkcs7_transform}' ./src/erlpkcs7.erl
