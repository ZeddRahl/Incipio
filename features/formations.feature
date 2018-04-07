Feature : formations
  As an admin I am able to CRUD a Formation
  
  @createSchema
  Scenario: I can see Formations Homepage
    Given I am logged in as "admin"
    Given I am on "/formations"
    Then the response status code should be 200
    Then I should see "Liste des formations"
  
  Scenario: I can see Formations Homepage
    Given I am logged in as "admin"
    Given I am on "/formations/admin"
    Then the response status code should be 200
    Then I should see "Formations - Espace Admin"
  
  Scenario: I can see a Formation
    Given I am logged in as "admin"
    Given I am on "/formations/3"
    Then the response status code should be 200
    Then I should see "Modifier une formation"
    And I should see "Télécharger les documents"
    and I should see "Supprimer la formation"
    
  Scenario: I can add a Formation
    Given I am logged in as "admin"
    Given I am on "/formations/admin/ajouter"
    Then the response status code should be 200
    When I fill in "Titre" with "Formation Git"
    When I fill in "Mandat" with "2018"
    When I fill in "Description" with "Introduction à GitLab"
    When I fill in "Categories" with "Suivi d'études"
    When I fill in "Date de début" with "2017-04-14 18:00"
    When I fill in "Date de fin" with "2017-04-14 19:00"
    And I press "Enregistrer la Formation"
    # it will create the formation id 1
    Then the url should match "/formations/1"
    And I should see "Formation enregistrée"
    And I should see "Formation Git"
    And I should see "Modifier une formation"
    And I should see "Télécharger les documents"
    and I should see "Supprimer la formation"
    
  Scenario: I can edit a Formation
    Given I am logged in as "admin"
    Given I am on "/formations/admin/modifier/1"
    Then the response status code should be 200
    When I fill in "Titre" with "Formation GitLab"
    And I press "Enregistrer la Formation"
    Then the url should match "/formations/1"
    And I should see "Formation enregistrée"
    And I should see "Formation GitLab"
    And I should see "Modifier une formation"
    And I should see "Télécharger les documents"
    and I should see "Supprimer la formation"
    
  Scenario: I can delete a Formation
    Given I am logged in as "admin"
    Given I am on "/formations/1"
    Then the response status code should be 200
    And I press "Supprimer la Formation"
    Then the url should match "/formation"
    And I should not see "Formation GitLab"
    
  Scenarion: I can see Participation to a Formation
    Given I am logged in as "admin"
    Given I am on "/formations/admin/participation"
    Then the response status code should be 200
    Then I should see "Présence aux formations"
    
  @dropSchema
  Scenario: Void
    Given I am logged in as "admin"