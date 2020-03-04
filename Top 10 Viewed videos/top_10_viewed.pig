youtube = load '/home/matlab/youtube/youtubedata' using PigStorage ('\t') as (id:chararray,uploader:chararray, age:int, category:chararray, lenth:int, views:int, rate:float, ratings:int, comments:chararray, relate:chararray);
file = filter youtube by views is not null;
ordered = order file by views DESC;
final = foreach ordered generate  $0, $3, $5;
result = limit final 10;
store result into '/home/matlab/youtube/output3';
