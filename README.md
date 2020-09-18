erlpkcs7
=====

a practice for parse transform
一个强行用parse transform的例子

generate code following:
用来生成:
```erlang
gen_pad_binary(1) -> <<1>>;
gen_pad_binary(2) -> <<2, 2>>;
gen_pad_binary(3) -> <<3, 3, 3>>;
gen_pad_binary(4) -> <<4, 4, 4, 4>>;
gen_pad_binary(5) -> <<5, 5, 5, 5, 5>>;
gen_pad_binary(6) -> <<6, 6, 6, 6, 6, 6>>;
gen_pad_binary(7) -> <<7, 7, 7, 7, 7, 7, 7>>;
gen_pad_binary(8) -> <<8, 8, 8, 8, 8, 8, 8, 8>>;
gen_pad_binary(9) -> <<9, 9, 9, 9, 9, 9, 9, 9, 9>>;
gen_pad_binary(10) ->
<<10, 10, 10, 10, 10, 10, 10, 10, 10, 10>>;
gen_pad_binary(11) ->
<<11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11>>;
gen_pad_binary(12) ->
<<12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12>>;
gen_pad_binary(13) ->
<<13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13>>;
gen_pad_binary(14) ->
<<14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14>>;
gen_pad_binary(15) ->
<<15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15>>;
gen_pad_binary(16) ->
<<16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16>>.
​```erlang

```