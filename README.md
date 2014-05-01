Group Name: FiJoLu2048

Members: Jonas Purtschert, Luca Tondelli

## Simulating a fish swarm with enemies.



# General Introduction

In this paper we want to understand and investigate the behavior of a fish swarm. The swarm consists of a group of objects in which each object acts as an individual but also needs to cooperate with others to achieve their aim i.e not starve or become food of an enemy. We are interested in how they act in an environment with enemies. This can be seen as a simulation of swarms living in a natural. We want to investigate the impact on the swarm behavior with different number of enemies and which parameters results in the most realistic swarm behavior. We were motivated by documentary movies where the fishes stay close together and build a swarm to reduce the risk of getting eaten by a predator and also increase the time where each individual can search food. The knowledge of the individuals not to be scared of enemies in the artificial environment should cause a different behavior of the whole swarm.



# Model
We chose the predator-prey model suggested in the paper reference [1]. In this model there exist two types of agents: predators and preys. It’s represented on a 2D Cartesian plane which represents the environment of the predator and preys. The model will not consider interactions between the environment and the agents in this model. In contrast to the paper we will not only consider different numbers of predators but rather also different numbers of preys.
We will consider only interactions between preys, preys and predators and also between predators. All forces are directed radially between agents and are power laws of the distance of the agents. The model uses force parameters to give the different forces different weight. The interaction between preys is modelled through long distance attractive and short distance repulsive forces. The preys-predator interaction is modelled through an anti-Newtonian force. The magnitude of this force is equal for both agents and also both forces point in the direction of the prey. This force is also non-conservative, which allows the model to stay in motion indefinitely. As in the paper we will consider three different forces between the predators. In first place there will be no interaction between predators at all. Second a repulsive and thirdly an attractive force between the predators. All those three types of interaction between predators appear in the nature.


# Fundamental Question

Which configuration of the model best reflects the reality?
Is the configuration found in the first question the best for a swarm attacked by a predator, if not what optimization could be done?


# Expected Results

We think that with different interaction forms of the predators and different force parameters will dramatically change the swarm behavior. With the model configuration with less predators and the same interaction as the preys we expect to get the most realistic swarm behavior. We think that too many predators with no or repulsive interaction will cause in a diffusion of the swarm. We also expect a different behavior of the swarm with different force parameters. But it’s hard to predict the exact impact of different force parameters on the swarm behavior. 


# Research Methods

We are going to use MATLAB for modelling agent-based models of fish swarms, their enemy and their behavior. We use the model introduced in the paper listed below[1].

# References
[1] Simple predator-prey swarming model – Vladimir Zhdankin and J.C. Sprott 2010
