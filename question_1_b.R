df = read.table("C:/top10_sample.csv", header=FALSE, sep="\t") #Reads data 

for (data in df ) #Splits brands by ,
   {   
       data <- as.character(data)        
       brands <- strsplit(data, ",", fixed=TRUE)  
   }


keyword_list <- c();

for(keywords in brands) # Removes [] in brands
{ 
     keywords <- sub("[","",keywords,fixed = TRUE)
     keywords <- sub("]","",keywords,fixed = TRUE)
         
     for (keyword in keywords)
         {
          keyword_list <- append(keyword_list, keyword) 
         }
}

#Removes duplicated brands
removed_duplicated_keyword_list <- keyword_list[!duplicated(keyword_list)]  

#Creates a data frame with columns brand_name and word_count
word_freq_df <- data.frame(brand_name = removed_duplicated_keyword_list, count = 0)

for(word in keyword_list) # Sets word_occurence for each brand
{ 
 word_freq_df$count[which(word_freq_df$brand_name == word)] <- word_freq_df$count[which(word_freq_df$brand_name == word)] + 1
}

#Sorts brands by word occurence (desc)
word_freq_df[order(-word_freq_df[2]),]


