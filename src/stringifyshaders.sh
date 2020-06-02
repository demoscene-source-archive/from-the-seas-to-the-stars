
sed -r 's/\s+/ /g; s/\/\/.*$//g; s/^\s//g; /^\s*$/d;' fragment.glsl > fragment_min.glsl
tail -n +2 fragment_min.glsl > fragment_min2.glsl
#tr -d '\n' < fragment_min2.glsl > fragment_min.glsl
echo '#version 430' > fragment_min.glsl
cat fragment_min2.glsl >> fragment_min.glsl
sed -r 's/\\/\\\\/g; s/"/\\"/g; s/^/"/g; s/$/"/g' fragment_min2.glsl > fragment.glsl.h
