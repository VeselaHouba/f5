# Changelog

Please document all changes here.
Follow rules from [Keep a Changelog](https://keepachangelog.com/en/0.3.0/)

## [Unreleased]
- Added option to define partitions for ASM policies
- Fixed bug with re-creating ASM policy instead of deactivating
- LTM policies are auto-generated and they inherit partition from Virtual Server

## [2.0.2] - 2020-09-24
### Changed
- **Breaking change** - ASM LTM policy is now created for each virtual server and new variable `asm_policy` is introduced. You can still use `policies` for custom definition to keep backward compatibility, but auto-generation of 1 LTM policy for 1 ASM policy is disabled.

## [1.0.0] - 2020-04-08
### Changed
- **Breaking change** - iApp template definition now has to state `name` variable. (Added due to partial deploy). Variable is not used in deploy.
