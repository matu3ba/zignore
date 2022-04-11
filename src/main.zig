const std = @import("std");
const testing = std.testing;

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

// test cases derived from https://git-scm.com/docs/gitignore
// matches no file:
//
// serves as comment:
// #
// pattern starting with hash:
// \#
// negates pattern:
// !pattern
// literal !:
// \!
// note: !pattern!pattern2 will include back pattern
// / directory separator:
// /dir/dir2/
// prefix-/ incl. or infix-/ => matching relative to .gitignore file:
// /pattern(/) or patter/pattern2(/)
// without prefix-/ or infix-/ => matches all files+directories
// pattern(/)
// '*' matches anything buf '/', '?' matches any 1 char but not '/'
// */*/test
// test?/*.test
// range notation [a-zA-Z] match 1 char in a range, see fnmatch, FNM_PATHNAME
// test[0-9]/*.test
// test[0-100]/*.test valid expression?
// leading **/ match all directories or also respective filenames, if following
// **/
// **/pattern
// **/pattern/pattern2 => pattern is dir of pattern2
// trailing /** matches everything inside (with infinite depth)
// pattern/** (relative to .gitignore)
// pattern/**/pattern2 matches 0 or more directories
// pattern/pattern2, pattern/a/pattern2, pattern/a/b/pattern2
// other '*' are considered with aforementioned semantics:
// ***, **** invalid
//
// TODO
// simple parser => only range might be tricky
// test cases
// performance/size optimized parser => SoA
