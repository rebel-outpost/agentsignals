# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items.
  navigation.selected_class = 'active'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that
  # will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name, item| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false
  
  # If this option is set to true, all item names will be considered as safe (passed through html_safe). Defaults to false.
  # navigation.consider_item_names_as_safe = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>if: -> { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>unless: -> { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>.
    #
    primary.item :dashboard_icon, "", class: "fa fa-home"
    primary.item :dashboard, 'Dashboard', dashboard_path

    primary.item :leads_icon, "", class: "fa fa-users"
    primary.item :leads, 'Leads', '#leads-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |lead|
      lead.dom_id = 'leads-collapse'
      lead.dom_class = 'panel-collapse collapse'
      lead.item :create_lead, 'Create Lead', new_lead_path
      lead.item :view_leads, 'View Leads', leads_path
      lead.item :create_web_to_lead, 'Create Web-to-Lead', web_to_lead_path
    end

    primary.item :clients_icon, "", class: "fa fa-users"
    primary.item :clients, 'Clients', clients_path


    primary.item :contacts_icon, "", class: "fa fa-user"
    primary.item :contacts, 'Contacts', '#contacts-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |contact|
      contact.dom_id = 'contacts-collapse'
      contact.dom_class = 'panel-collapse collapse'
      contact.item :create_contact, 'Create Contact', new_contact_path
      contact.item :view_contacts, 'View Contacts', contacts_path
    end

    primary.item :listings_icon, "", class: "fa fa-briefcase"
    primary.item :listings, 'Listings', '#listings-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |listing|
      listing.dom_id = 'listings-collapse'
      listing.dom_class = 'panel-collapse collapse'
      listing.item :create_listing, 'Create Listing', new_listing_path
      listing.item :view_listings, 'View Listings', listings_path
    end

    primary.item :offers_icon, "", class: "fa fa-dollar"
    primary.item :offers, 'Offers', '#offers-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |offer|
      offer.dom_id = 'offers-collapse'
      offer.dom_class = 'panel-collapse collapse'
      offer.item :create_offer, 'Create Offer', new_offer_path
      offer.item :view_offers, 'View Offers', offers_path
    end

    primary.item :tasks_icon, "", class: "fa fa-check-square-o"
    primary.item :tasks, 'Tasks', '#tasks-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |task|
      task.dom_id = 'tasks-collapse'
      task.dom_class = 'panel-collapse collapse'
      task.item :create_task, 'Create Task', new_task_path
      task.item :view_tasks, 'View Tasks', tasks_path
    end

    primary.item :opportunities_icon, "", class: "fa fa-thumbs-up"
    primary.item :opportunities, 'Opportunities', '#opportunities-collapse', {
      link: {
        data: {
          toggle: 'collapse',
          parent: "#side-nav"
        },
        class: 'accordion-toggle collapsed'
      }
    } do |opportunity|
      opportunity.dom_id = 'opportunities-collapse'
      opportunity.dom_class = 'panel-collapse collapse'
      opportunity.item :create_opportunity, 'Create Opportunity', new_opportunity_path
      opportunity.item :view_opportunities, 'View Opportunities', opportunities_path
    end
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
