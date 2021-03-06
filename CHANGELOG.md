# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

## [0.2.5]
### Added
- IE11 support https://github.com/owncloud/phoenix/pull/2082
- Draw.io app integration https://github.com/owncloud/phoenix/pull/2083
- New file menu entries for different file types https://github.com/owncloud/phoenix/pull/2111
- Drone starlark https://github.com/owncloud/phoenix/pull/2112
- Rename and delete will be disallowed in case the parent folder has no permissions fot these two operations https://github.com/owncloud/phoenix/pull/2129
- Progress bar for upload https://github.com/owncloud/phoenix/pull/2176
- Handle errors while deleting and renaming files https://github.com/owncloud/phoenix/pull/2177
- Logout option on access denied page https://github.com/owncloud/phoenix/pull/2178
- Download feedback spinner https://github.com/owncloud/phoenix/pull/2179
- Remove rootFolder from breadcrumbs https://github.com/owncloud/phoenix/pull/2196
- Send header X-Requested-With: XMLHttpRequest in all requests https://github.com/owncloud/phoenix/pull/2197
- X-Frame-Options and Content-Security-Policy https://github.com/owncloud/phoenix/pull/2311

### Fixed
- IE11 support for media viewer app https://github.com/owncloud/phoenix/pull/2086
- Files drop when link password is set https://github.com/owncloud/phoenix/pull/2096
- Detection of public pages despite existing auth https://github.com/owncloud/phoenix/pull/2097
- Public link access in incognito mode https://github.com/owncloud/phoenix/pull/2110
- Password handling in public links https://github.com/owncloud/phoenix/pull/2117
- More close options to file actions menu https://github.com/owncloud/phoenix/pull/2161
- Reset search value on clear action https://github.com/owncloud/phoenix/pull/2198
- Prevent duplicate token refresh calls https://github.com/owncloud/phoenix/pull/2205
- Use PQueue to run only one create folder promise in folder upload https://github.com/owncloud/phoenix/pull/2210
- Upon token refresh do not perform full login on sdk level https://github.com/owncloud/phoenix/pull/2211
- Exit link on access denied page https://github.com/owncloud/phoenix/pull/2220
- Structure of folders in folder upload https://github.com/owncloud/phoenix/pull/2224
- Remove file from progress after download on IE11 https://github.com/owncloud/phoenix/pull/2310
- Properly reset capabilities on logout https://github.com/owncloud/phoenix/pull/2116

### Changed
- For mounted folders use the full url as private link https://github.com/owncloud/phoenix/pull/2170
- Store route in vuex before login in case user is unauthorized https://github.com/owncloud/phoenix/pull/2170
- Use currentFolder path in breadcrumbs https://github.com/owncloud/phoenix/pull/2196
- Switch to show instead of if in upload progress bar https://github.com/owncloud/phoenix/pull/2206
- Key of file action buttons to ariaLabel https://github.com/owncloud/phoenix/pull/2219
- Trigger add to progress before the folders creation https://github.com/owncloud/phoenix/pull/2221
- Handle remove from progress in its own mutation https://github.com/owncloud/phoenix/pull/2225
- Use oidc-client 1.9.1 https://github.com/owncloud/phoenix/pull/2261

### Security
- Added sanitization to markdown editor app https://github.com/owncloud/phoenix/pull/2233

### Removed
- Drag and drop in ie11 because of compatibility issues https://github.com/owncloud/phoenix/pull/2128

## [0.2.4]
### Added
- Private link for the current folder to the app bar https://github.com/owncloud/phoenix/pull/2009

### Fixed
- Clear state in case of error in authorisation https://github.com/owncloud/phoenix/pull/2079
- Hide comma before mdate if there is no size https://github.com/owncloud/phoenix/pull/2073
- Don't perform OIDC logout in case of error in authorisation https://github.com/owncloud/phoenix/pull/2072


### Changed
- Use sharetype keys that are human readable instead of number https://github.com/owncloud/phoenix/pull/2071

## [0.2.3]
### Added
- Set X-Requested-With header - required ownCloud 10.3 https://github.com/owncloud/phoenix/pull/1984
- Use 2 spaces instead of tab for feature files https://github.com/owncloud/phoenix/pull/2004
- Handle OAuth/OpenIdConnect error in callback request query string https://github.com/owncloud/phoenix/pull/2011
- Enable loading apps from external sites https://github.com/owncloud/phoenix/pull/1986
- Add default client side sort https://github.com/owncloud/phoenix/pull/1972

### Fixed
- Public link permissions mix up https://github.com/owncloud/phoenix/pull/1985
- Downgrade vuex-persist to 2.0.1 to fix IE11 issues https://github.com/owncloud/phoenix/pull/2007

## [0.2.2]
### Added
- Show error message when user tries to upload a folder in IE11 https://github.com/owncloud/phoenix/pull/1956
- Error message if the folder or file name is empty in create dialog and added default value https://github.com/owncloud/phoenix/pull/1938
- Bookmarks to menu https://github.com/owncloud/phoenix/pull/1949

### Fixed
- Redirect to access denied page if the user doesn't have access to Phoenix instance https://github.com/owncloud/phoenix/pull/1939
- Redirect to private link after user has logged in https://github.com/owncloud/phoenix/pull/1900
- Breaking of link to help desk on new line https://github.com/owncloud/phoenix/pull/1940

## [0.2.1]
### Added
- Download feedback https://github.com/owncloud/phoenix/pull/1895

### Fixed
- Download of files shared with password-protected public links https://github.com/owncloud/phoenix/issues/1808
- Search button on mobile devices https://github.com/owncloud/phoenix/pull/1893
- Collapsing of alert messages after they have been closed https://github.com/owncloud/phoenix/pull/1881

## [0.2.0]
### Added
- Collaborators (replacement for shares)
- Public and private links
- Shared with me and Shared with others lists
- Favorites page
- Trash bin page

## [0.1.0]
### Added
- Initial early alpha release

[Unreleased]: https://github.com/owncloud/phoenix/compare/0.1.0...master
[0.1.0]: https://github.com/owncloud/phoenix/compare/d1cfc2d5f82202ac30c91e903e4810f42650c183...0.1.0

