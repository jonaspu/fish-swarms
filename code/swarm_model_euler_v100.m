%--------VARIBALES TO SET--------%

% field size
maxX = 20;
maxY = 20;

% spreading of prey (range of initial position)
spreadPrey = 5;

% spreading of predator (range of initial position)
spreadPred = 2;

% method of predator predator forces
% method = 1: no force
% method = 2: repulsive force
% method = 3: attractive force
method = 3;

% number of preys
nOfPrey = 7;

% number of predators
nOfPred = 3;

%the function variables
gamma = -1;
alpha = -2;

% mass of prey
preyMass = 0.1;

% mass of predator
predMass = 0.2;

% preyFriction of prey
preyFriction = 0.1;

% preyFriction of predator
predFriction = 0.1;



%--------INITIALISATION--------%

% timestep (0.01 seems to be optimal)
step = 0.01;

% prey setup
positionPrey = rand(2,nOfPrey) * spreadPrey - spreadPrey/2; % position
speedPrey = zeros(2, nOfPrey); % speed

% predator setup
positionPred = rand(2, nOfPred) * spreadPred - spreadPred/2; % position
speedPred = zeros(2, nOfPred); % speed

% temporariy positions for calculation
positionPredTemp = zeros(2, nOfPred);
positionTemp = zeros(2, nOfPrey);

% save of the simulation
preyPlot = positionPrey;
predPlot = positionPred;

%--------ITERATION--------%
for l = 1:100000

    %updating the predators
    updatePred;
    
    %updating the preys
    for i = 1 : nOfPrey 
        
        % prey-prey forces
        % vectors between actual prey to all preys
        vector =  bsxfun(@minus, positionPrey , positionPrey(:,i));
        
        % norms of vectors
        distance = sqrt(sum(vector.^2, 1));
        
        % attractive force & deletion of nan values
        attract = bsxfun(@times, vector, distance.^(gamma-1));
        attract = attract(:, all(~isnan(attract)));
        
        % repulsive force % deletion of nan values
        repulse = bsxfun(@times, vector, distance.^(alpha-1));
        repulse = repulse(:, all(~isnan(repulse)));
        
        
        % prey-predator forces
        % vectors between actual prey to all predators
        vectorPred = bsxfun(@minus, positionPred, positionPrey(:,i));
        
        % norms of vectors
        distancePred = sqrt(sum(vectorPred.^2, 1));
        
       
        % pred-prey force
        predpreyForce = sum(bsxfun(@times, vectorPred, distancePred.^(gamma-1)),2);

        % prey-prey force
        completeForce = sum(attract-repulse, 2);
        
        % complete force with friction
        finalForce = completeForce - preyFriction*speedPrey(:, i) - predpreyForce;
        
        % acceleration
        acceleration = finalForce./preyMass;
        
        % speedupdate
        speedPrey(:, i) = speedPrey(:, i) + step*acceleration;
        
        % positionupdate
        positionTemp(:,i) = positionPrey(:,i) + step*speedPrey(:,i);

    end

    %updating the position of preys
    positionPrey = positionTemp;
    positionPred = positionPredTemp;
    
    % save positions for later plotting
    preyPlot = [preyPlot; positionPrey];
    predPlot = [predPlot; positionPred];
    
    %plotting the preys & predators
    plot(positionPrey(1, :), positionPrey(2, :), 'b*', positionPred(1,:), positionPred(2,:), 'r*')
    xlim([-maxX, maxY])
    ylim([-maxX, maxY])
    pause(0.0001)
    
end




