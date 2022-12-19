function res = clip(v, clip_min, clip_max)
v_smaller_than_clip_min = v < clip_min;
v_bigger_than_clip_max = v > clip_max;

res = v;
res(v_smaller_than_clip_min) = clip_min;
res(v_bigger_than_clip_max) = clip_max;

end