
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thaigov

<!-- badges: start -->

[![R-CMD-check](https://github.com/asiripanich/thaigov/workflows/R-CMD-check/badge.svg)](https://github.com/asiripanich/thaigov/actions)
<!-- badges: end -->

The goal of thaigov is to provide an easy access to the datasets on the
[Open Government Data of Thailand](https://data.go.th/) API from R. The
Thai documentation of the API can be viewed here:
<https://opendata.data.go.th/pages/data-go-th-api>.

เป้าหมายของ `thaigov` แพ็คเก็จคือการทำให้ผู้ใช้ R
สามารถเข้าถึงข้อมูลเปิดของรัฐบาลไทยได้ง่ายยิ่งขึ้น
คุณสามารถอ่านรายละเอียดของ API ได้ที่
<https://opendata.data.go.th/pages/data-go-th-api>

## Installation (การติดตั้ง)

You can install the development version of thaigov from
[GitHub](https://github.com/) with:

ติดตั้งแพ็คเกจได้จาก GitHub โดยใช้โค้ดดังต่อไปนี้:

``` r
# install.packages("devtools")
devtools::install_github("asiripanich/thaigov")
```

## Example (ตัวอย่าง)

First put your Open Government Data of Thailand API key in your
machine’s `.Renviron` file. I normally use `usethis::edit_r_environ()`
to find and open my `.Renviron` file. Insert the your API key in the
following format: `THGOV_OPENDATA_TOKEN=<your-API-key>`.

ก่อนอื่นเราต้องบันทึกค่า API คีย์ไปยัง `.Renviron` ไฟล์ ซึ่งคุณสามารถใช้
`usethis::edit_r_environ()` ในการเปิดไฟล์ขึ้นมา จากนั้นให้นำ API
คีย์ลงไปใส่ดังต่อไปนี้ `THGOV_OPENDATA_TOKEN=<your-API-key>`

``` r
library(thaigov)
library(tibble)

covid_resources <- th_resource_search("name:COVID-19") # search for resources that contain the word "COVID" in Thai in their description.
#> Warning in data.table::rbindlist(., fill = TRUE): Column 2 ['cache_last_updated'] of item 1 is length 0. This (and 74 others like it) has been filled with NA (NULL for list columns) to make each item uniform.
covid_resources %>% as_tibble()
#> # A tibble: 16 × 36
#>    resource_disaggregate cache_last_upda… package_id datastore_conta… datastore_active id       size resource_last_y… metadata_modifi… resource_unit_o… state resource_last_u… hash  description resource_access… format resource_unit_o…
#>    <chr>                 <lgl>            <chr>      <chr>            <lgl>            <chr>   <int> <chr>            <chr>            <chr>            <chr> <chr>            <chr> <chr>       <chr>            <chr>  <chr>           
#>  1 "[\"\\u0e2d\\u0e38\\… NA               7e13ce95-… False            FALSE            e014… NA      2656             2022-02-22T06:5… ""               acti… 2022-01-13       ""    ""          ""               JSON   ""              
#>  2 "[]"                  NA               15a62b5a-… False            FALSE            48d1…  1.49e6 <NA>             2021-09-16T07:4…  <NA>            acti… <NA>             ""    ""          ""               PDF     <NA>           
#>  3 "[]"                  NA               8a956917-… <NA>             TRUE             4688…  3.26e6 <NA>             <NA>              <NA>            acti… 2022-04-12       ""    ""          ""               XLSX    <NA>           
#>  4 "[]"                  NA               15a62b5a-… False            FALSE            5e82…  1.05e6 <NA>             2021-09-16T07:4…  <NA>            acti… <NA>             ""    ""          ""               PDF     <NA>           
#>  5 "[]"                  NA               8a956917-… <NA>             TRUE             93d2…  4.77e7 <NA>             <NA>              <NA>            acti… 2022-03-01       ""    ""          ""               XLSX    <NA>           
#>  6 "[]"                  NA               8a956917-… <NA>             TRUE             1c2f…  4.86e7 <NA>             <NA>              <NA>            acti… <NA>             ""    ""          ""               XLSX    <NA>           
#>  7 "[]"                  NA               8a956917-… <NA>             TRUE             87ab…  4.89e7 <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            XLSX    <NA>           
#>  8 "[]"                  NA               8a956917-… <NA>             TRUE             67d4…  3.73e7 <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            XLSX    <NA>           
#>  9 "[]"                  NA               8a956917-… <NA>             TRUE             8946…  1.23e7 <NA>             <NA>              <NA>            acti… 2022-04-12       ""    ""          ""               CSV     <NA>           
#> 10 "[]"                  NA               8a956917-… <NA>             TRUE             a783…  2.08e8 <NA>             <NA>              <NA>            acti… 2022-03-01       ""    ""          ""               CSV     <NA>           
#> 11 "[]"                  NA               8a956917-… <NA>             TRUE             8337…  2.14e8 <NA>             <NA>              <NA>            acti… <NA>             ""    ""          ""               CSV     <NA>           
#> 12 "[]"                  NA               8a956917-… <NA>             TRUE             026c…  2.28e8 <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            CSV     <NA>           
#> 13 "[]"                  NA               8a956917-… <NA>             TRUE             be19…  1.87e8 <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            CSV     <NA>           
#> 14 "[]"                  NA               8a956917-… <NA>             FALSE            5b62… NA      <NA>             <NA>              <NA>            acti… <NA>             ""    "Open API …  <NA>            API     <NA>           
#> 15 "[]"                  NA               8a956917-… <NA>             FALSE            24fe… NA      <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            API     <NA>           
#> 16 "[]"                  NA               8a956917-… <NA>             TRUE             402c…  1.07e4 <NA>             <NA>              <NA>            acti… <NA>             ""    ""           <NA>            XLSX    <NA>           
#> # … with 19 more variables: mimetype_inner <lgl>, url_type <chr>, resource_unit_of_measure <chr>, mimetype <chr>, cache_url <lgl>, name <chr>, created <chr>, url <chr>, created_at <chr>, resource_official_statistics <chr>,
#> #   resource_data_release_calendar <chr>, last_modified <chr>, position <int>, revision_id <chr>, resource_first_year_of_data <chr>, resource_type <lgl>, resource_data_collect_other <chr>, resource_data_collect <chr>,
#> #   resource_created_date <chr>
covid_csv_datasets <- covid_resources %>%
  .[format == "CSV" & !is.na(id), id] %>%
  lapply(function(x) th_get(x) %>% as_tibble())
covid_csv_datasets
#> [[1]]
#> # A tibble: 100 × 12
#>    `_id`     No. announce_date       `Notified date`     sex     age Unit  nationality province_of_isolation risk                          province_of_onset district_of_onset
#>    <int>   <int> <chr>               <chr>               <chr> <int> <chr> <chr>       <chr>                 <chr>                         <chr>             <chr>            
#>  1     1 3905873 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      54 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         จอมทอง           
#>  2     2 3905874 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      36 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         เมืองเชียงใหม่      
#>  3     3 3905875 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      31 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         ดอยหล่อ           
#>  4     4 3905876 2022-12-04T00:00:00 2022-11-04T00:00:00 ชาย      37 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             ""                ต่างจังหวัด         
#>  5     5 3905877 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      33 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         แม่ริม             
#>  6     6 3905878 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      12 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         แม่แตง            
#>  7     7 3905879 2022-12-04T00:00:00 2022-11-04T00:00:00 ชาย      32 ""    Thailand    เชียงใหม่               สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ "เชียงใหม่"         แม่ริม             
#>  8     8 3905880 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      55 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         สารภี             
#>  9     9 3905881 2022-12-04T00:00:00 2022-11-04T00:00:00 หญิง      45 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         เมืองเชียงใหม่      
#> 10    10 3905882 2022-12-04T00:00:00 2022-11-04T00:00:00 ชาย      42 ""    Thailand    เชียงใหม่               อยู่ระหว่างการสอบสวน             "เชียงใหม่"         สันกำแพง          
#> # … with 90 more rows
#> 
#> [[2]]
#> # A tibble: 100 × 12
#>    `_id`     No. announce_date       `Notified date`     sex     age Unit  nationality province_of_isolation risk                          province_of_onset district_of_onset
#>    <int>   <int> <chr>               <chr>               <chr> <int> <chr> <chr>       <chr>                 <chr>                         <chr>             <chr>            
#>  1     1 2869617 2022-02-28T00:00:00 2022-02-27T00:00:00 ชาย      41 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             เมืองพะเยา        
#>  2     2 2869618 2022-02-28T00:00:00 2022-02-27T00:00:00 หญิง      45 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             เมืองพะเยา        
#>  3     3 2869619 2022-02-28T00:00:00 2022-02-27T00:00:00 หญิง      40 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             เมืองพะเยา        
#>  4     4 2869620 2022-02-28T00:00:00 2022-02-27T00:00:00 ชาย      44 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             เมืองพะเยา        
#>  5     5 2869621 2022-02-28T00:00:00 2022-02-27T00:00:00 ชาย      11 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             เมืองพะเยา        
#>  6     6 2869622 2022-02-28T00:00:00 2022-02-27T00:00:00 หญิง      19 ปี     Thailand    พะเยา                 อยู่ระหว่างการสอบสวน             พะเยา             เมืองพะเยา        
#>  7     7 2869623 2022-02-28T00:00:00 2022-02-27T00:00:00 หญิง      22 ปี     Thailand    พะเยา                 อยู่ระหว่างการสอบสวน             พะเยา             เมืองพะเยา        
#>  8     8 2869624 2022-02-28T00:00:00 2022-02-27T00:00:00 ชาย      61 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             แม่ใจ             
#>  9     9 2869625 2022-02-28T00:00:00 2022-02-27T00:00:00 หญิง      46 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             แม่ใจ             
#> 10    10 2869626 2022-02-28T00:00:00 2022-02-27T00:00:00 ชาย      61 ปี     Thailand    พะเยา                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ พะเยา             แม่ใจ             
#> # … with 90 more rows
#> 
#> [[3]]
#> # A tibble: 100 × 12
#>    `_id`     No. announce_date       `Notified date`     sex     age Unit  nationality province_of_isolation risk                                province_of_onset district_of_onset
#>    <int>   <int> <chr>               <chr>               <chr> <int> <chr> <chr>       <chr>                 <chr>                               <chr>             <chr>            
#>  1     1 1859158 2021-10-26T00:00:00 2021-10-25T00:00:00 ชาย      20 ปี     "Thailand"  ลำปาง                 อื่นๆ                                 ลำปาง             เมืองลำปาง        
#>  2     2 1859159 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      42 ปี     "Thailand"  ลำปาง                 อื่นๆ                                 ลำปาง             เมืองลำปาง        
#>  3     3 1859160 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      33 ปี     "Thailand"  ลำปาง                 ไปสถานที่ชุมชน เช่น ตลาดนัด สถานที่ท่องเที่ยว ลำปาง             ห้างฉัตร           
#>  4     4 1859161 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      52 ปี     "Thailand"  ลำปาง                 ไปสถานที่ชุมชน เช่น ตลาดนัด สถานที่ท่องเที่ยว ลำปาง             ห้างฉัตร           
#>  5     5 1859162 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      84 ปี     "Thailand"  ลำปาง                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้       ลำปาง             เมืองลำปาง        
#>  6     6 1859163 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      42 ปี     "Thailand"  ลำปาง                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้       ลำปาง             เมืองลำปาง        
#>  7     7 1859164 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง      62 ปี     "Thailand"  ลำปาง                 สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้       ลำปาง             เมืองลำปาง        
#>  8     8 1859165 2021-10-26T00:00:00 2021-10-25T00:00:00 ชาย      50 ปี     "Thailand"  ลำปาง                 อื่นๆ                                 ลำปาง             เมืองลำปาง        
#>  9     9 1859166 2021-10-26T00:00:00 2021-10-25T00:00:00 ชาย      24 ปี     ""          ลำพูน                  อื่นๆ                                 ลำพูน              เมือง             
#> 10    10 1859167 2021-10-26T00:00:00 2021-10-25T00:00:00 หญิง       5 ปี     ""          ลำพูน                  อื่นๆ                                 ลำพูน              ทุ่งหัวช้าง          
#> # … with 90 more rows
#> 
#> [[4]]
#> # A tibble: 100 × 12
#>    `_id`    No. announce_date       `Notified date`     sex     age Unit  nationality province_of_isolation risk                          province_of_onset district_of_onset
#>    <int>  <int> <chr>               <chr>               <chr> <int> <chr> <chr>       <chr>                 <chr>                         <chr>             <chr>            
#>  1     1 816990 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย       7 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  2     2 816991 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย       1 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  3     3 816992 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย      35 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  4     4 816993 2021-12-08T00:00:00 2021-11-08T00:00:00 หญิง      33 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  5     5 816994 2021-12-08T00:00:00 2021-11-08T00:00:00 หญิง      14 ปี     Thailand    เชียงราย               สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ ""                ""               
#>  6     6 816995 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย      39 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  7     7 816996 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย      45 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  8     8 816997 2021-12-08T00:00:00 2021-11-08T00:00:00 หญิง      32 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#>  9     9 816998 2021-12-08T00:00:00 2021-11-08T00:00:00 หญิง       7 ปี     Thailand    เชียงราย               อื่นๆ                           ""                ""               
#> 10    10 816999 2021-12-08T00:00:00 2021-11-08T00:00:00 ชาย       8 ปี     Thailand    เชียงราย               สัมผัสใกล้ชิดกับผู้ป่วยยืนยันรายก่อนหน้านี้ ""                ""               
#> # … with 90 more rows
#> 
#> [[5]]
#> # A tibble: 100 × 12
#>    `_id`   No. announce_date       sex   age   Unit  nationality province_of_isolation risk                         province_of_onset district_of_onset `Notified date`
#>    <int> <int> <chr>               <chr> <chr> <chr> <chr>       <chr>                 <chr>                        <chr>             <chr>             <chr>          
#>  1     1     1 2020-12-01T00:00:00 หญิง   61    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  2     2     2 2020-01-17T00:00:00 หญิง   74    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  3     3     3 2020-01-22T00:00:00 หญิง   73    ปี     Thailand    นครปฐม                คนต่างชาติเดินทางมาจากต่างประเทศ นครปฐม            "เมือง"            <NA>           
#>  4     4     4 2020-01-22T00:00:00 ชาย   68    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  5     5     5 2020-01-24T00:00:00 หญิง   66    ปี     China       นนทบุรี                 คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  6     6     6 2020-01-25T00:00:00 หญิง   33    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  7     7     7 2020-01-26T00:00:00 หญิง   57    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#>  8     8     8 2020-01-26T00:00:00 หญิง   73    ปี     China       ประจวบคีรีขันธ์           คนต่างชาติเดินทางมาจากต่างประเทศ ประจวบคีรีขันธ์       "หัวหิน"            <NA>           
#>  9     9     9 2020-01-28T00:00:00 ชาย   63    ปี     China       กรุงเทพมหานคร          คนต่างชาติเดินทางมาจากต่างประเทศ กรุงเทพมหานคร      ""                <NA>           
#> 10    10    10 2020-01-28T00:00:00 หญิง   28    ปี     China       นนทบุรี                 คนต่างชาติเดินทางมาจากต่างประเทศ นนทบุรี             ""                <NA>           
#> # … with 90 more rows

th_package_list() %>% sample(size = 10)
#>  [1] "garbage_service"                                                 "tpsok_13"                                                        "stat_set_th-csv"                                                
#>  [4] "item_b5612bd8-6aa4-4c0d-b6e4-d925543ae772"                       "cfoubon-apr2564"                                                 "tpsocpi_3"                                                      
#>  [7] "item_a99cfdc9-5d4e-443b-b561-d655c0baf482"                       "my-dataset-research-index-stairway-to-national-development-2015" "dt132020"                                                       
#> [10] "dataset41_02"
# th_package_search("โควิด") # search for packages that contain the word "COVID" in Thai.
# ​th_package_show("3e9d9124-d187-4fc7-b2fb-22c681ceb4fe")
```
