
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thaigov

<!-- badges: start -->

[![R-CMD-check](https://github.com/asiripanich/thaigov/workflows/R-CMD-check/badge.svg)](https://github.com/asiripanich/thaigov/actions)
<!-- badges: end -->

The goal of thaigov is to provide an easy access to the datasets on the
[Open Government Data of Thailand](https://data.go.th/) API from R.

The Thai documentation of the API can be viewed here:
<https://opendata.data.go.th/pages/data-go-th-api>.

## Installation

You can install the development version of thaigov from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("asiripanich/thaigov")
```

## Example

First put your Open Government Data of Thailand API key in your
machine’s `.Renviron` file. I normally use `usethis::edit_r_environ()`
to find and open my `.Renviron` file. Insert the your API key in the
following format: `THGOV_OPENDATA_TOKEN=<your-API-key>`.

``` r
library(thaigov)

th_package_list() %>% sample(size = 10)
#>  [1] "dataset51_02"                              "os_12_00018"                               "item_a6287b62-0c4a-427d-aad1-29c4809d07cb" "antifakenewscenter"                        "dataset-pp_36_04"                         
#>  [6] "harvest-energy"                            "dpm010"                                    "dataset-pp_32_031"                         "propertytax"                               "bangkok-fir-jun-2563"
th_package_search("โควิด")[, 1:3] # search for packages that contain the word "COVID" in Thai.
#>                     license_title                                            maintainer private
#>  1: Creative Commons Attributions                                           กรมควบคุมโรค   FALSE
#>  2: Creative Commons Attributions กองการแพทย์จีโนมิกส์และสนับสนุนนวัตกรรม, ศูนย์เทคโนโลยีสารสนเทศ   FALSE
#>  3:         License not specified                                 สำนักข่าว กรมประชาสัมพันธ์   FALSE
#>  4:         License not specified                                 สำนักข่าว กรมประชาสัมพันธ์   FALSE
#>  5:              Open Data Common                                  สำนักเทคโนโลยีสารสนเทศ   FALSE
#>  6:              Open Data Common                                     สำนักอนามัยสิ่งแวดล้อม   FALSE
#>  7:         License not specified                                  กองยุทธศาสตร์และแผนงาน   FALSE
#>  8:         License not specified                                        สุทรามาศ ยะหัตตะ   FALSE
#>  9:         License not specified                                       ผกาวรรณ กองกันภัย   FALSE
#> 10:         License not specified                                 สำนักข่าว กรมประชาสัมพันธ์   FALSE
th_package_show("3e9d9124-d187-4fc7-b2fb-22c681ceb4fe")
#> Warning in data.table::rbindlist(., fill = TRUE): Column 5 ['resource_disaggregate'] of item 1 is length 0. This (and 9 others like it) has been filled with NA (NULL for list columns) to make each item uniform.
#> $package
#> $package$license_title
#> [1] "Creative Commons Attributions"
#> 
#> $package$maintainer
#> [1] "วัชระ อินทรสูตร"
#> 
#> $package$private
#> [1] FALSE
#> 
#> $package$maintainer_email
#> [1] "vachara@exat.co.th"
#> 
#> $package$num_tags
#> [1] 5
#> 
#> $package$update_frequency_unit
#> [1] "เดือน"
#> 
#> $package$license_id
#> [1] "Creative Commons Attributions"
#> 
#> $package$id
#> [1] "3e9d9124-d187-4fc7-b2fb-22c681ceb4fe"
#> 
#> $package$metadata_created
#> [1] "2021-08-06T15:19:47.956214"
#> 
#> $package$metadata_modified
#> [1] "2022-03-29T08:39:52.230718"
#> 
#> $package$author
#> NULL
#> 
#> $package$author_email
#> NULL
#> 
#> $package$state
#> [1] "active"
#> 
#> $package$version
#> NULL
#> 
#> $package$update_frequency_interval
#> [1] "1"
#> 
#> $package$type
#> [1] "dataset"
#> 
#> $package$num_resources
#> [1] 10
#> 
#> $package$data_type
#> [1] "ข้อมูลระเบียน"
#> 
#> $package$creator_user_id
#> [1] "a2d96e15-4245-4e3d-9a47-bb333e355c37"
#> 
#> $package$data_source
#> [1] "ไม่ทราบ"
#> 
#> $package$name
#> [1] "adresit"
#> 
#> $package$isopen
#> [1] FALSE
#> 
#> $package$notes
#> [1] "ข้อมูลรถขัดข้องบนทางพิเศษ เช่น รถขัดข้อง รถเสีย น้ำมันหมด ยางแตก เป็นต้น"
#> 
#> $package$owner_org
#> [1] "a3491b78-d7c1-4063-8952-d71cc5b7c2a1"
#> 
#> $package$telephone_number
#> [1] "0853456368"
#> 
#> $package$data_category
#> [1] "ข้อมูลสาธารณะ"
#> 
#> $package$geo_coverage
#> [1] "จังหวัด"
#> 
#> $package$title
#> [1] "ข้อมูลรถขัดข้องบนทางพิเศษ"
#> 
#> $package$revision_id
#> [1] "ca7b36fb-684d-4792-899b-418e8e5e2c21"
#> 
#> 
#> $organization
#> $organization$description
#> [1] "หน่วยงานระดับกรม"
#> 
#> $organization$created
#> [1] "2020-06-01T16:53:09.130872"
#> 
#> $organization$title
#> [1] "การทางพิเศษแห่งประเทศไทย"
#> 
#> $organization$name
#> [1] "exat"
#> 
#> $organization$is_organization
#> [1] TRUE
#> 
#> $organization$state
#> [1] "active"
#> 
#> $organization$image_url
#> [1] ""
#> 
#> $organization$revision_id
#> [1] "b45ef3ef-ba5b-4680-9f7f-899a914f35bc"
#> 
#> $organization$type
#> [1] "organization"
#> 
#> $organization$id
#> [1] "a3491b78-d7c1-4063-8952-d71cc5b7c2a1"
#> 
#> $organization$approval_status
#> [1] "approved"
#> 
#> 
#> $tags
#>     state display_name                                   id    name
#> 1: active       ทางด่วน 21724ad3-3442-47cc-a11b-72aa6494b402  ทางด่วน
#> 2: active      ทางพิเศษ ffa3aa2c-0dde-4b7c-bfed-4586b0fbdd3a ทางพิเศษ
#> 3: active      น้ำมันหมด dd2cd575-8eca-4f9f-ab50-1284cfec934b น้ำมันหมด
#> 4: active       ยางแตก 212bc74e-bfdc-44cf-9bcb-a7c904632d34  ยางแตก
#> 5: active      รถขัดข้อง a13d34d4-6871-4e25-bc38-cd85890bb379 รถขัดข้อง
#> 
#> $resourcess
#>                               package_id datastore_active                                   id    size resource_disaggregate  state hash                                            description format              last_modified url_type
#>  1: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe            FALSE 8b01c530-c421-4098-8ac1-a3d47cbd0d7a     455                       active                                                                ZIP 2021-10-25T07:55:55.907679   upload
#>  2: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 0753ab8a-95bd-4354-913a-58da0464baf5     445                       active                                           คำอธิบายรายการข้อมูล    CSV 2021-08-06T23:15:48.156351   upload
#>  3: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe            FALSE 873e0b1c-8a23-49d3-b6d9-1e898d2218cd      NA                       active                API Document : https://exat-man.web.app/docs    API                       <NA>     <NA>
#>  4: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 245c98c3-2f92-4d58-a892-3fabf2af0772      NA                       active       ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2559 (ต.ค.58 - ก.ย.59)    CSV                       <NA>     <NA>
#>  5: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 64deecc3-49cd-4d98-8743-c863b89b0c1f      NA                       active       ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2560 (ต.ค.59 - ก.ย.60)    CSV                       <NA>     <NA>
#>  6: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 58ee3b94-c311-49a9-9d17-63a6401f63d8      NA                       active       ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2561 (ต.ค.60 - ก.ย.61)    CSV                       <NA>     <NA>
#>  7: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 8d1783b5-b91b-45f4-867f-31ac7fe14c09      NA                       active      ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 25562 (ต.ค.61 - ก.ย.62)    CSV                       <NA>     <NA>
#>  8: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE cbb37106-cb4b-4311-99ef-debdcc4da57b      NA                       active       ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2563 (ต.ค.62 - ก.ย.63)    CSV                       <NA>     <NA>
#>  9: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 38eb58fa-4d86-4c43-8f37-5c5494d1e28a 1904054                       active       ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2564 (ต.ค.63 - ก.ย.64)    CSV 2021-10-25T07:55:52.714942   upload
#> 10: 3e9d9124-d187-4fc7-b2fb-22c681ceb4fe             TRUE 7a4c6a3d-869b-4787-8440-6a898cf337b2  827415                       active                                                                CSV 2022-03-29T08:39:52.164761   upload
#>            mimetype     downloadall_datapackage_hash                                                   name                    created
#>  1: application/zip 22a420a762fc3f58859269803244da0d                                      All resource data 2021-08-06T15:19:49.397430
#>  2:            <NA>                             <NA>                                              Meta Data 2021-08-06T23:15:48.292004
#>  3:            <NA>                             <NA>                                      ข้อมูลรถขัดข้อง (API) 2021-08-07T23:11:57.132363
#>  4:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2559 (ต.ค.58 - ก.ย.59) 2021-08-06T15:20:51.632106
#>  5:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2560 (ต.ค.59 - ก.ย.60) 2021-08-06T15:22:51.924233
#>  6:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2561 (ต.ค.60 - ก.ย.61) 2021-08-06T15:24:16.349496
#>  7:        text/csv                             <NA> ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 25562 (ต.ค.61 - ก.ย.62) 2021-08-06T15:25:19.406084
#>  8:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2563 (ต.ค.62 - ก.ย.63) 2021-08-06T15:26:29.021831
#>  9:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2564 (ต.ค.63 - ก.ย.64) 2021-08-06T15:27:47.758271
#> 10:        text/csv                             <NA>  ข้อมูลรถขัดข้องบนทางพิเศษ ปีงบประมาณ 2565 (ต.ค.64 - ก.พ.65) 2021-12-01T06:16:06.304195
#>                                                                                                                                                url downloadall_metadata_modified position                          revision_id
#>  1:      https://data.go.th/dataset/3e9d9124-d187-4fc7-b2fb-22c681ceb4fe/resource/8b01c530-c421-4098-8ac1-a3d47cbd0d7a/download/adresit-zd2fpk.zip    2021-10-25T07:55:52.788789        0 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  2:        https://data.go.th/dataset/3e9d9124-d187-4fc7-b2fb-22c681ceb4fe/resource/0753ab8a-95bd-4354-913a-58da0464baf5/download/adresit_metadata                          <NA>        1 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  3:                                                                                                 https://exat-man.web.app/api/EXAT_Crash/2565/1                          <NA>        2 a4c33f8d-ce86-491f-bf32-7c1b3a4c254e
#>  4: http://catalog.exat.co.th/dataset/91f4d2fc-2f62-40b3-bdc9-57a5b1d748a5/resource/f0e3b5fe-46db-4e2f-8af7-e336d76bb3d9/download/adresit_2559.csv                          <NA>        3 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  5: http://catalog.exat.co.th/dataset/91f4d2fc-2f62-40b3-bdc9-57a5b1d748a5/resource/888c2b03-c856-44a1-b7cd-fa78e84fb662/download/adresit_2560.csv                          <NA>        4 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  6: http://catalog.exat.co.th/dataset/91f4d2fc-2f62-40b3-bdc9-57a5b1d748a5/resource/f92f9491-a9ad-4f6c-b083-0a9471609d92/download/adresit_2561.csv                          <NA>        5 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  7: http://catalog.exat.co.th/dataset/91f4d2fc-2f62-40b3-bdc9-57a5b1d748a5/resource/916fe3d3-adf1-415d-bd29-be07d03ac96a/download/adresit_2562.csv                          <NA>        6 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  8: http://catalog.exat.co.th/dataset/91f4d2fc-2f62-40b3-bdc9-57a5b1d748a5/resource/a7cae754-e111-4e8e-8eda-6f6d6e17be24/download/adresit_2563.csv                          <NA>        7 ca7b36fb-684d-4792-899b-418e8e5e2c21
#>  9:        https://data.go.th/dataset/3e9d9124-d187-4fc7-b2fb-22c681ceb4fe/resource/38eb58fa-4d86-4c43-8f37-5c5494d1e28a/download/adresit_2564.csv                          <NA>        8 ca7b36fb-684d-4792-899b-418e8e5e2c21
#> 10:        https://data.go.th/dataset/3e9d9124-d187-4fc7-b2fb-22c681ceb4fe/resource/7a4c6a3d-869b-4787-8440-6a898cf337b2/download/adresit_2565.csv                          <NA>        9 a4c33f8d-ce86-491f-bf32-7c1b3a4c254e
#>     resource_data_collect_other resource_accessible_condition resource_data_collect
#>  1:                        <NA>                          <NA>                  <NA>
#>  2:                        <NA>                          <NA>                  <NA>
#>  3:                                                                                
#>  4:                        <NA>                          <NA>                  <NA>
#>  5:                        <NA>                          <NA>                  <NA>
#>  6:                        <NA>                          <NA>                  <NA>
#>  7:                        <NA>                          <NA>                  <NA>
#>  8:                        <NA>                          <NA>                  <NA>
#>  9:                        <NA>                          <NA>                  <NA>
#> 10:                                                                                
#> 
#> $groups
#>        display_name                                description image_display_url            title                                   id     name
#> 1: คมนาคมและโลจิสติกส์ คมนาคมและโลจิสติกส์ (Transport and Logistics)                   คมนาคมและโลจิสติกส์ 4809e81d-5bf6-416b-ad70-6f929d811dc5 logistic
th_get("245c98c3-2f92-4d58-a892-3fabf2af0772")
#>      _id          crash_date crash_time             expw_step         cause
#>   1:   1 2015-10-01T00:00:00   09:25:25                บูรพาวิถี          คลัทช์
#>   2:   2 2015-10-01T00:00:00   20:10:10            เฉลิมมหานคร        ยางแตก
#>   3:   3 2015-10-01T00:00:00   20:55:55            เฉลิมมหานคร        ยางแตก
#>   4:   4 2015-10-01T00:00:00   10:00:00            เฉลิมมหานคร        ยางแตก
#>   5:   5 2015-10-01T00:00:00   23:40:40                ฉลองรัช        ยางแตก
#>   6:   6 2015-10-01T00:00:00   14:19:19                ฉลองรัช        ยางแตก
#>   7:   7 2015-10-01T00:00:00   13:23:23                บูรพาวิถี        ยางแตก
#>   8:   8 2015-10-01T00:00:00   11:03:03                ฉลองรัช        ยางแตก
#>   9:   9 2015-10-01T00:00:00   08:10:10                ฉลองรัช        ยางแตก
#>  10:  10 2015-10-01T00:00:00   23:20:20                ฉลองรัช        ยางแตก
#>  11:  11 2015-10-01T00:00:00   08:22:22                ฉลองรัช        ยางแตก
#>  12:  12 2015-10-01T00:00:00   13:27:27                บูรพาวิถี        ยางแตก
#>  13:  13 2015-10-01T00:00:00   09:24:24                ฉลองรัช        ยางแตก
#>  14:  14 2015-10-01T00:00:00   08:58:58                บูรพาวิถี        ยางแตก
#>  15:  15 2015-10-01T00:00:00   06:26:26                บูรพาวิถี        ยางแตก
#>  16:  16 2015-10-01T00:00:00   08:31:31                บูรพาวิถี        ยางแตก
#>  17:  17 2015-10-01T00:00:00   21:37:37          บางพลี-สุขสวัสดิ์        ยางแตก
#>  18:  18 2015-10-01T00:00:00   17:50:50          บางพลี-สุขสวัสดิ์        ยางแตก
#>  19:  19 2015-10-01T00:00:00   16:49:49          บางพลี-สุขสวัสดิ์        ยางแตก
#>  20:  20 2015-10-01T00:00:00   14:43:43          บางพลี-สุขสวัสดิ์        ยางแตก
#>  21:  21 2015-10-01T00:00:00   16:51:51          บางพลี-สุขสวัสดิ์        ยางแตก
#>  22:  22 2015-10-01T00:00:00   21:06:06 ทางหลวงพิเศษหมายเลข 37        ยางแตก
#>  23:  23 2015-10-01T00:00:00   16:00:00          บางพลี-สุขสวัสดิ์        ยางแตก
#>  24:  24 2015-10-01T00:00:00   15:51:51 ทางหลวงพิเศษหมายเลข 37        ยางแตก
#>  25:  25 2015-10-01T00:00:00   15:45:45 ทางหลวงพิเศษหมายเลข 37        ยางแตก
#>  26:  26 2015-10-01T00:00:00   08:02:02          บางพลี-สุขสวัสดิ์        ยางแตก
#>  27:  27 2015-10-01T00:00:00   06:53:53 ทางหลวงพิเศษหมายเลข 37        ยางแตก
#>  28: 135 2015-10-02T00:00:00   18:42:42                  ศรีรัช      ระบบเบรค
#>  29:  28 2015-10-01T00:00:00   03:15:15 ทางหลวงพิเศษหมายเลข 37        ยางแตก
#>  30:  29 2015-10-01T00:00:00   08:51:51               อุดรรัถยา        ยางแตก
#>  31:  30 2015-10-01T00:00:00   11:04:04               อุดรรัถยา        ยางแตก
#>  32:  31 2015-10-01T00:00:00   06:25:25            เฉลิมมหานคร        ยางแตก
#>  33:  32 2015-10-01T00:00:00   08:24:24                  ศรีรัช        ยางแตก
#>  34:  33 2015-10-01T00:00:00   13:50:50            เฉลิมมหานคร        ยางแตก
#>  35:  34 2015-10-01T00:00:00   23:06:06          บางพลี-สุขสวัสดิ์        ยางแตก
#>  36:  35 2015-10-01T00:00:00   18:10:10          บางพลี-สุขสวัสดิ์        ยางแตก
#>  37:  36 2015-10-01T00:00:00   14:53:53                  ศรีรัช        ยางแตก
#>  38:  37 2015-10-01T00:00:00   17:29:29                  ศรีรัช        ยางแตก
#>  39:  38 2015-10-01T00:00:00   07:54:54            เฉลิมมหานคร        ระบบไฟ
#>  40:  39 2015-10-01T00:00:00   23:28:28            เฉลิมมหานคร        ระบบไฟ
#>  41:  40 2015-10-01T00:00:00   02:21:21 ทางหลวงพิเศษหมายเลข 37        ระบบไฟ
#>  42:  41 2015-10-01T00:00:00   07:58:58            เฉลิมมหานคร         น้ำแห้ง
#>  43:  42 2015-10-01T00:00:00   18:13:13                บูรพาวิถี         น้ำแห้ง
#>  44:  43 2015-10-01T00:00:00   17:39:39          บางพลี-สุขสวัสดิ์         น้ำแห้ง
#>  45:  44 2015-10-01T00:00:00   15:40:40          บางพลี-สุขสวัสดิ์         น้ำแห้ง
#>  46:  45 2015-10-01T00:00:00   16:00:00            เฉลิมมหานคร         น้ำแห้ง
#>  47:  46 2015-10-01T00:00:00   23:22:22            เฉลิมมหานคร       ตกร่องน้ำ
#>  48:  47 2015-10-01T00:00:00   20:00:00            เฉลิมมหานคร       น้ำมันหมด
#>  49:  48 2015-10-01T00:00:00   19:19:19                ฉลองรัช       น้ำมันหมด
#>  50:  49 2015-10-01T00:00:00   14:58:58                ฉลองรัช       น้ำมันหมด
#>  51:  50 2015-10-01T00:00:00   15:23:23                บูรพาวิถี       น้ำมันหมด
#>  52:  51 2015-10-01T00:00:00   16:45:45                บูรพาวิถี       น้ำมันหมด
#>  53:  52 2015-10-01T00:00:00   23:02:02 ทางหลวงพิเศษหมายเลข 37       น้ำมันหมด
#>  54:  53 2015-10-01T00:00:00   19:33:33          บางพลี-สุขสวัสดิ์       น้ำมันหมด
#>  55:  54 2015-10-01T00:00:00   16:30:30            เฉลิมมหานคร       น้ำมันหมด
#>  56:  55 2015-10-01T00:00:00   16:51:51                ฉลองรัช      ระบบคลัทช์
#>  57:  56 2015-10-01T00:00:00   10:59:59          บางพลี-สุขสวัสดิ์      ระบบคลัทช์
#>  58:  57 2015-10-01T00:00:00   16:44:44                  ศรีรัช      เกียร์ชำรุด
#>  59:  58 2015-10-01T00:00:00   10:02:02                ฉลองรัช    ระบบส่งกำลัง
#>  60:  59 2015-10-01T00:00:00   09:32:32          บางพลี-สุขสวัสดิ์  เพลากลางชำรุด
#>  61:  60 2015-10-01T00:00:00   17:30:30            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  62:  61 2015-10-01T00:00:00   09:45:45            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  63:  62 2015-10-01T00:00:00   17:33:33                ฉลองรัช เครื่องยนต์ขัดข้อง
#>  64:  63 2015-10-01T00:00:00   08:07:07                ฉลองรัช เครื่องยนต์ขัดข้อง
#>  65:  64 2015-10-01T00:00:00   16:56:56                ฉลองรัช เครื่องยนต์ขัดข้อง
#>  66:  65 2015-10-01T00:00:00   14:07:07                บูรพาวิถี เครื่องยนต์ขัดข้อง
#>  67:  66 2015-10-01T00:00:00   11:21:21                บูรพาวิถี เครื่องยนต์ขัดข้อง
#>  68:  67 2015-10-01T00:00:00   08:35:35                บูรพาวิถี เครื่องยนต์ขัดข้อง
#>  69:  68 2015-10-01T00:00:00   08:30:30                บูรพาวิถี เครื่องยนต์ขัดข้อง
#>  70:  69 2015-10-01T00:00:00   07:29:29                บูรพาวิถี เครื่องยนต์ขัดข้อง
#>  71:  70 2015-10-01T00:00:00   07:00:00          บางพลี-สุขสวัสดิ์ เครื่องยนต์ขัดข้อง
#>  72:  71 2015-10-01T00:00:00   16:02:02          บางพลี-สุขสวัสดิ์ เครื่องยนต์ขัดข้อง
#>  73:  72 2015-10-01T00:00:00   19:43:43          บางพลี-สุขสวัสดิ์ เครื่องยนต์ขัดข้อง
#>  74:  73 2015-10-01T00:00:00   16:43:43          บางพลี-สุขสวัสดิ์ เครื่องยนต์ขัดข้อง
#>  75:  74 2015-10-01T00:00:00   07:16:16          บางพลี-สุขสวัสดิ์ เครื่องยนต์ขัดข้อง
#>  76:  75 2015-10-01T00:00:00   09:47:47               อุดรรัถยา เครื่องยนต์ขัดข้อง
#>  77:  76 2015-10-01T00:00:00   16:42:42                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  78:  77 2015-10-01T00:00:00   16:38:38            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  79:  78 2015-10-01T00:00:00   20:46:46                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  80:  79 2015-10-01T00:00:00   06:36:36                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  81:  80 2015-10-01T00:00:00   10:39:39            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  82:  81 2015-10-01T00:00:00   16:00:00            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  83:  82 2015-10-01T00:00:00   21:50:50            เฉลิมมหานคร เครื่องยนต์ขัดข้อง
#>  84:  83 2015-10-01T00:00:00   11:06:06                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  85:  84 2015-10-01T00:00:00   08:52:52                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  86:  85 2015-10-01T00:00:00   08:15:15                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  87:  86 2015-10-01T00:00:00   19:11:11                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  88:  87 2015-10-01T00:00:00   17:30:30                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  89:  88 2015-10-01T00:00:00   17:14:14                  ศรีรัช เครื่องยนต์ขัดข้อง
#>  90:  89 2015-10-02T00:00:00   18:34:34            เฉลิมมหานคร        ยางแตก
#>  91:  90 2015-10-02T00:00:00   07:00:00            เฉลิมมหานคร        ยางแตก
#>  92:  91 2015-10-02T00:00:00   07:28:28            เฉลิมมหานคร        ยางแตก
#>  93:  92 2015-10-02T00:00:00   17:42:42            เฉลิมมหานคร        ยางแตก
#>  94:  93 2015-10-02T00:00:00   11:52:52            เฉลิมมหานคร        ยางแตก
#>  95:  94 2015-10-02T00:00:00   19:04:04                ฉลองรัช        ยางแตก
#>  96:  95 2015-10-02T00:00:00   08:15:15                ฉลองรัช        ยางแตก
#>  97:  96 2015-10-02T00:00:00   15:38:38                บูรพาวิถี        ยางแตก
#>  98:  97 2015-10-02T00:00:00   13:32:32                บูรพาวิถี        ยางแตก
#>  99:  98 2015-10-02T00:00:00   12:41:41                บูรพาวิถี        ยางแตก
#> 100:  99 2015-10-02T00:00:00   17:17:17                บูรพาวิถี        ยางแตก
#>      _id          crash_date crash_time             expw_step         cause
```
