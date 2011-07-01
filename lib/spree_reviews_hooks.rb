class SpreeReviewsHooks < Spree::ThemeSupport::HookListener
  
  Deface::Override.new(
    :virtual_path => "layouts/admin",
    :name => 'reviews_admin_tab',
    :insert_bottom => "[data-hook='admin_tabs']",
    :text => %(<%= tab(:reviews) %>)
  )
  
  Deface::Override.new(
    :virtual_path => "admin/configurations/index",
    :name => 'reviews_settings',
    :insert_after => "[data-hook='admin_configurations_menu']",
    :text => %(
      <tr>
        <td><%= link_to t('reviews_review_settings', :default => 'Review Settings'), admin_review_settings_path %></td>
        <td><%= t('reviews_manage_review_settings', :default => 'Manage Review Settings') %></td>
      </tr>
    )
  )
  
  Deface::Override.new(
    :virtual_path => "admin/shared/_configuration_menu",
    :name => 'reviews_settings_sidebar',
    :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
    :text => %(
      <li<%== ' class="active"' if controller.controller_name == 'review_settings' %>>
        <%= link_to t("reviews_review_settings", :default => 'Review Settings'), admin_review_settings_path %>
      </li>
    )
  )
  
  Deface::Override.new(
    :virtual_path => "products/_taxons",
    :name => 'product_reviews',
    :insert_after => "div#taxon-crumbs",
    :partial => "shared/reviews"
  )
  
end
