# discourse-upload-into-settings plugin

This plugin adds the capability to upload files into site settings.

### The problem

The Discourse functionality of importing and exporting site settings using `rake site_settings:import` and `rake site_settings:export` exports settings of type `upload` as strings, and does not work with imports at all.

### The solution

It is desirable to have a functionality where one can specify a file name or URL as the value for a site setting of type `upload`. This plugin adds that, so when it has been installed you can do this

`logo: "https://example.com/logo.png"`

or 

`logo: "/tmp/logo.png"`

or 

`logo: "/uploads/default/original/1X/a554e79435de350a862e6c98efd3dc46196bbf31.png"`

### Supported settings

This plugin extends the functionality for these settings:
* logo
* logo_small
* digest_logo
* mobile_logo
* logo_dark
* logo_small_dark
* mobile_logo_dark
* large_icon
* manifest_icon
* favicon
* apple_touch_icon
* opengraph_image
* twitter_summary_large_image

### Reference

This plugin was built by CommuniteQ (https://www.communiteq.com/) for the [Developer Overheid](https://developer.overheid.nl) project that was initiated by the Dutch Ministry of the Interior and Kingdom Relations in collaboration with the Association of Dutch Municipalities / VNG Realisatie.

