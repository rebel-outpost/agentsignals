# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items.
  navigation.selected_class = 'active'
  navigation.items do |primary|

    primary.item :dashboard_icon, "", class: "fa fa-home"
    primary.item :dashboard, 'Dashboard', dashboard_path

    primary.item :leads_icon, "", class: "fa fa-users"
    primary.item :leads, 'Leads', leads_path do |lead|
      lead.dom_class = 'nav nav-pills'
      lead.item :view_leads, 'Leads', leads_path
      lead.item :new_lead, 'New Lead', new_lead_path
      lead.item :create_web_to_lead, 'Create Web-to-Lead', web_to_lead_path
    end

    primary.item :clients_icon, "", class: "fa fa-users"
    primary.item :clients, 'Clients', clients_path do |client|
      client.dom_class = 'nav nav-pills'
      client.item :view_clients, 'Clients', clients_path
      client.item :new_client_path, 'New Client', new_client_path
    end

    primary.item :agents_icon, "", class: "fa fa-users"
    primary.item :agents, 'Agents', agents_path do |agent|
      agent.dom_class = 'nav nav-pills'
      agent.item :view_agents, 'Agents', agents_path
      agent.item :new_agent, 'Add Agent Contact', new_agent_path
    end

    primary.item :listings_icon, "", class: "fa fa-briefcase"
    primary.item :listings, 'Listings', listings_path do |listing|
      listing.dom_class = 'nav nav-pills'
      listing.item :view_listings, 'View Listings', listings_path
      listing.item :create_listing, 'Create Listing', new_listing_path
    end

    primary.item :offers_icon, "", class: "fa fa-dollar"
    primary.item :offers, 'Offers', offers_path do |offer|
      offer.dom_class = 'nav nav-pills'
      offer.item :view_offers, 'Offers', offers_path
      offer.item :create_offer, 'New Offer', new_offer_path
    end

    primary.item :tasks_icon, "", class: "fa fa-check-square-o"
    primary.item :tasks, 'Tasks', tasks_path do |task|
      task.dom_class = 'nav nav-pills'
      task.item :view_tasks, 'Tasks', tasks_path
      task.item :create_task, 'New Task', new_task_path
    end

    primary.item :opportunities_icon, "", class: "fa fa-thumbs-up"
    primary.item :opportunities, 'Opportunities', opportunities_path do |opportunity|
      opportunity.dom_class = 'nav nav-pills'
      opportunity.item :view_opportunities, 'Opportunities', opportunities_path
      opportunity.item :create_opportunity, 'New Opportunity', new_opportunity_path
    end

    primary.item :appointment_icon, "", class: "fa fa-bell"
    primary.item :appointments, 'Appointments', '#'

    primary.item :showing_icon, "", class: "fa fa-car"
    primary.item :showings, 'Showings', '#'


    primary.item :calendar_icon, "", class: "fa fa-calendar"
    primary.item :calendar, 'Calendar', calendar_index_path

    # Already in top nav bar
    # primary.item :account_settings_icon, "", class: "fa fa-gears" if current_user
    # primary.item :account_settings, 'Account Settings', settings_account_path(current_user.account) if current_user


    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    # primary.item :key_3, 'Admin', url, class: 'special', if: -> { current_user.admin? }
    # primary.item :key_4, 'Account', url, unless: -> { logged_in? }

    # you can also specify html attributes to attach to this particular level
    # works for all levels of the menu
    primary.dom_attributes = {id: 'side-nav', class: 'side-nav'}


    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false
  end
end
