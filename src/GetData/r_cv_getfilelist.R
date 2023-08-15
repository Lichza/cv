r_cv_getfilelist <- function() {

  file_list <- NULL
  
  file_list<-list.files(path = "./src/GetData/Data/",
                      pattern=".txt",
                      full.names=T)

  data_list <- lapply(file_list, jsonlite::read_json)

  all_filenames <- file_list %>%
    tools::file_path_sans_ext() %>%
    sub(pattern=".src/GetData/Data/", replacement="",x=.) %>%
    sub(pattern=".", replacement="",x=.)

  if (length(data_list)>0) {
    for (i in 1:length(data_list)) {
      names(data_list)[[i]] <- all_filenames[i]
    }
  }

  return(data_list)
}