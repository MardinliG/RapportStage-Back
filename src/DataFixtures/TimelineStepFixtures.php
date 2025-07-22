<?php

namespace App\DataFixtures;

use App\Entity\TimelineStep;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class TimelineStepFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $step = new TimelineStep();
        $step->setTitle('Étape 1');
        $step->setDescription('Description de l\'étape 1');
        $step->setDate(new \DateTime('2023-01-01'));
        $manager->persist($step);

        $manager->flush();
    }
}
