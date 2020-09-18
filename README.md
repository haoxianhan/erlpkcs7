erlpkcs7
=====

Description
-----------

a practice for parse transform

## Installation

Add erlpkcs7 to  ```rebar.config``` dependencies:

    {deps, [
        {erlpkcs,{git , "https://github.com/haoxianhan/erlpkcs7.git", {tag, "master"}}}
    ]}.

## Usage
#### pad:
```erlang
erlpkcs7:pad(<<1,1,2>>).
%% <<1,1,2,13,13,13,13,13,13,13,13,13,13,13,13,13>>
```

#### unpad:
```erlang
erlpkcs7:unpad(<<1, 1, 1, 1, 1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11>>).
%% <<1,1,1,1,1>>
```
