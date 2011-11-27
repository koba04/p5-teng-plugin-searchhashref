use inc::Module::Install;
name 'Teng-Plugin-SearchHashRef';
all_from 'lib/Teng/Plugin/SearchHashRef.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
