youtube = load '/home/matlab/youtube/youtubedata' using PigStorage ('\t') as (id:chararray,uploader:chararray, age:int, category:chararray, lenth:int, views:int, rate:float, ratings:int, comments:chararray, relate:chararray);
files = filter youtube by category is not null;
groupbycat = group files by category;
result = foreach groupbycat{
         sort = order files by ratings DESC;
         top = limit sort 10;
         generate flatten(top);
         };
final = foreach result generate $0, $3, $7;
store final into '/home/matlab/youtube/output4';
