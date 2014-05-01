%--------NO FORCE--------%
if( method == 1) 
    for s = 1 : nOfPred
        % vector between predator and prey
        vectorPred = bsxfun(@minus, positionPrey, positionPred(:,s));
        
        % norm of vector
        distancePred = sqrt(sum(vectorPred.^2, 1));
        
        % force on predator without friction
        predForce = bsxfun(@times, vectorPred, distancePred.^(gamma-1));
        
        % force on predator with preyFriction
        finalPredForce = sum(predForce, 2) - (predFriction * speedPred(:,s));
        
        % acceleration of predator
        accPred = finalPredForce ./ predMass;
        
        % speedupdate
        speedPred(:,s) = speedPred(:,s) + step*accPred;
        
        % positionupdate
        positionPredTemp(:,s) = positionPred(:,s) + step*speedPred(:,s);
       
    end
end

%--------REPULSIVE FORCE--------%
if( method == 2) 
    for s = 1 : nOfPred
        % vector between predator and prey
        vectorPred = bsxfun(@minus, positionPrey, positionPred(:,s));

        % norm of vector
        distancePred = sqrt(sum(vectorPred.^2, 1));

        % force on predator by preys
        predForce = bsxfun(@times, vectorPred, distancePred.^(gamma-1));

        % force on predator by preys and friction
        frictionPredForce = sum(predForce, 2) - (predFriction * speedPred(:,s));

        % vector between predator and predator
        vectorPredPred = bsxfun(@minus, positionPred, positionPred(:, s));

        % norm of vector
        distancePredPred = sqrt(sum(vectorPredPred.^2, 1));

        % attractive force
        attract = bsxfun(@times, vectorPredPred, distancePredPred.^(gamma-1));
        attract = attract(:, all(~isnan(attract)));

        % repulsive force
        repulse = bsxfun(@times, vectorPredPred, distancePredPred.^(alpha-1));
        repulse = repulse(:, all(~isnan(repulse)));

        % pred pred force
        predPredForce = sum(-attract-repulse, 2);

        % final force
        finalPredForce = frictionPredForce + predPredForce;


        % acceleration of predator
        accPred = finalPredForce ./ predMass;

        % speedupdate
        speedPred(:,s) = speedPred(:,s) + step*accPred;

        % positionupdate
        positionPredTemp(:,s) = positionPred(:,s) + step*speedPred(:,s);
    end
    
    
    
end

%--------ATTRACTIVE FORCE--------%
if( method == 3)
    for s = 1 : nOfPred
        % vector between predator and prey
        vectorPred = bsxfun(@minus, positionPrey, positionPred(:,s));

        % norm of vector
        distancePred = sqrt(sum(vectorPred.^2, 1));

        % force on predator by preys
        predForce = bsxfun(@times, vectorPred, distancePred.^(gamma-1));

        % force on predator by preys and friction
        frictionPredForce = sum(predForce, 2) - (predFriction * speedPred(:,s));

        % vector between predator and predator
        vectorPredPred = bsxfun(@minus, positionPred, positionPred(:, s));

        % norm of vector
        distancePredPred = sqrt(sum(vectorPredPred.^2, 1));

        % attractive force
        attract = bsxfun(@times, vectorPredPred, distancePredPred.^(gamma-1));
        attract = attract(:, all(~isnan(attract)));

        % repulsive force
        repulse = bsxfun(@times, vectorPredPred, distancePredPred.^(alpha-1));
        repulse = repulse(:, all(~isnan(repulse)));

        % pred pred force
        predPredForce = sum(attract-repulse, 2);

        % final force
        finalPredForce = frictionPredForce + predPredForce;


        % acceleration of predator
        accPred = finalPredForce ./ predMass;

        % speedupdate
        speedPred(:,s) = speedPred(:,s) + step*accPred;

        % positionupdate
        positionPredTemp(:,s) = positionPred(:,s) + step*speedPred(:,s);
    end
    
end

