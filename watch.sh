
HAML=source/slides.haml

compass watch source/ --sass-dir styles --css-dir ../gen/ --images-dir ../gen/images/ --javascripts-dir ../gen/js/ --relative-assets &

mkdir -p gen

while true
do
  inotifywait $HAML
  haml $HAML gen/`basename $HAML | sed s/haml$/html/`
  sleep 1
done

wait # Wait for compass-watch
