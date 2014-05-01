%field has size 100 x 100;
maxX = 10;
maxY = 10;
step = 0.01;

%create predators and preys and their corresponding matrices
nOfPrey = 5;
nOfPred = 1;
positionPrey = rand(2,nOfPrey);
positionPred = rand(2, nOfPred);

speedPrey = zeros(2, nOfPrey);
speedPred = zeros(2, nOfPred);

positionPredTemp = zeros(2, nOfPred);
positionTemp = zeros(2, nOfPrey);

positionPrey = positionPrey * 10 ;
positionPred = positionPred * 20;
%the prey variables
gamma = 0;
alpha = -1;
massPrey = 0.2;
fraction = 0.2;
%the predator variables
predFraction = 0.4;
massPred = 0.2;


%%calculate position and velocitiy of every prey / predator
for l = 1:100000


   %%updating the predators
    for s = 1 : nOfPred
        vectorPred = bsxfun(@minus, positionPrey, positionPred(:,s));
        distancePred = sqrt(sum(vectorPred.^2, 1));
        predForce = bsxfun(@times, vectorPred, distancePred.^(gamma-1));

        finalPredForce = sum(predForce, 2) - (predFraction * speedPred(:,s));
        accPred = finalPredForce ./ massPred;
        speedPred(:,s) = speedPred(:,s) + step*accPred;
        positionPredTemp(:,s) = positionPred(:,s) + step*speedPred(:,s);
       
    end
    %%updating the preys
    for i = 1 : nOfPrey 
       vector =  bsxfun(@minus, positionPrey , positionPrey(:,i));
       distance = sqrt(sum(vector.^2, 1));
       attract = bsxfun(@times, vector, distance.^(gamma-1));
       attract = attract(:, all(~isnan(attract)));
       repulse = bsxfun(@times, vector, distance.^(alpha-1));
       repulse = repulse(:, all(~isnan(repulse)));
       
        vectorPred = bsxfun(@minus, positionPred, positionPrey(:,i));
        distancePred = sqrt(sum(vectorPred.^2, 1));
        predpreyForce = sum(bsxfun(@times, vectorPred, distancePred.^(gamma-1)),2);
       
       % mass = 1, therefore force = acceleration
       completeForce = sum(attract-repulse, 2);
       finalForce = completeForce - fraction*speedPrey(:, i) - predpreyForce;
        
    
        
        
        acceleration = finalForce./massPrey;
       % newspeedprey = oldspeed + acceleration * 1timeunit (one iteration)
%        speedPrey(:, i) = speedPrey(:, i) + acceleration;
%        positionTemp(:, i) = positionPrey(:, i) + speedPrey(:, i);
        speedPrey(:, i) = speedPrey(:, i) + step*acceleration;
        positionTemp(:,i) = positionPrey(:,i) + step*speedPrey(:,i);
        
    end

    %updating the position of preys
    positionPrey = positionTemp;
    positionPred = positionPredTemp;
    
    
    
    
    %%plotting the preys & predators
    plot(positionPrey(1, :), positionPrey(2, :), 'b*', positionPred(1,:), positionPred(2,:), 'r*')
    xlim([-maxX, maxY])
    ylim([-maxX, maxY])
    pause(0.0001)
      
% % %     for j = 1: 10
% % %     plot(positionPrey(1,:),positionPrey(2,:), '*')
% % %     xlim([-maxX, maxY])
% % %     ylim([-maxX, maxY])
% % %     positionPrey = positionPrey + (positionTemp-positionPrey)./10;
% % %     pause(0.0005)  
% % %     end
    
end




