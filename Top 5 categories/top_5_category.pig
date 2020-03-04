youtube = load '/home/matlab/youtube/youtubedata' using PigStorage ('\t') as (id:chararray,uploader:chararray, age:int, category:chararray, lenth:int, views:int, rate:float, ratings:int, comments:chararray, relate:chararray);
groupbycat = group youtube by category;
result = foreach groupbycat generate group as category, COUNT(youtube) as total;
ordered = order result by total DESC;
final = limit ordered 5;
store final into '/home/matlab/youtube/output1';


