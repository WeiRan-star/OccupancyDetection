function [ new_particles ] = movingParticles(particles, motion_model, truth)
    new_particles = [];
    for i = 1: length(particles(:,1))
        %indices = motion_model(:, 1) == truth(2);
        indices = 1:length(motion_model(:, 1));
        candidates = motion_model(indices, 1:length(motion_model(1,:)));
        
        % fix if it is null (it shouldn't be...)
        if (isempty(candidates))
            disp('shadan');
        end
        
        [~, index] = min(abs(candidates(:,1) - particles(i,1)*100));
        
        r = rand;
        prob = candidates(index, 5:length(candidates(1,:)));
        future_occ = sum(r >= cumsum([0, prob]));
        new_particles = [new_particles; candidates(index, 1), future_occ - 1, particles(i,3)];
    end
end

