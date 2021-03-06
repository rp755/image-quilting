function [ out_im ] = loop_over_items(Im_inp, Im_target, alpha, patch_size, overlap_size, ex_tex, mode)
%LOOP_OVER_ITEMS
    if mode == 0
        out_im = -1 * ones(size(Im_target));
    else
        out_im = ex_tex;
    end
    out_size = size(Im_target);
    for i = 1:(patch_size(1)-overlap_size(1)):out_size(1)
        for j = 1:(patch_size(2)-overlap_size(2)):out_size(2)
            r_i = min((i + patch_size(1) - 1), out_size(1));
            c_j = min((j + patch_size(2) - 1), out_size(2));
            my_patch_size = size(out_im(i:r_i, j:c_j, :));
            
            o_1 = min(r_i - i + 1, overlap_size(1));
            o_2 = min(c_j - j + 1, overlap_size(2));
            %size(out_im(i:r_i, j:c_j, :))
            patch = get_quilt_patch(out_im(i:r_i, j:c_j, :), Im_target(i:r_i, j:c_j, :), alpha, Im_inp, my_patch_size, [o_1 o_2], i, j, mode);
%           size(patch)
%           size(out_im(i:r_i, j:c_j, :))
%           [i, r_i, j, c_j]
           out_im(i:r_i, j:c_j, :) = patch;
        end
    end
end
