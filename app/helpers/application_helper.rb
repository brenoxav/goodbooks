module ApplicationHelper
  def follow_btn(followed_user)
    if !current_user.follower_of?(followed_user)
      button_to '+', followings_path,
                params: { following: {
                  follower_id: current_user.id,
                  followed_id: followed_user.id
                } },
                class: 'follow-btn'
    else
      button_to '-', following_path(1), method: :delete,
                                       params: { following: {
                                         follower_id: current_user.id,
                                         followed_id: followed_user.id
                                       } },
                                       class: 'unfollow-btn'
    end
  end

  def pencil_icon(size)
    %(<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
      width="#{size}" height="#{size}"
      viewBox="0 0 226 226"
      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
      stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray=""
      stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none"
      style="mix-blend-mode: normal"><path d="M0,226v-226h226v226z" fill="none"></path>
      <g fill="#3a6e97">
      <path d="M173.39908,18.83333c-2.40948,0 -4.82163,0.91783 -6.65788,2.75879l-16.07454,16.07454l37.66667,37.66667l16.07454,-16.07454c3.68192,-3.68192 3.68192,-9.64326 0,-13.31576l-24.35091,-24.35091c-1.84096,-1.84096 -4.2484,-2.75879 -6.65788,-2.75879zM136.54167,51.79167l-89.45833,89.45833c0,0 9.46375,0.04708 14.125,4.70833c4.66125,4.66125 4.5612,13.97786 4.5612,13.97786c0,0 9.60147,0.1848 14.27214,4.85547c4.67067,4.67067 4.70833,14.125 4.70833,14.125l89.45833,-89.45833zM34.55843,160.08333l-6.30843,37.66667l37.66667,-6.30843z"></path></g></g>
    </svg>).html_safe
  end

  def envelope_icon(size)
    %(<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
      width="#{size}" height="#{size}"
      viewBox="0 0 226 226"
      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
      stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray=""
      stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none"
      style="mix-blend-mode: normal"><path d="M0,226v-226h226v226z" fill="none"></path>
      <g fill="#3a6e97"><path d="M188.33333,37.66667h-150.66667c-10.40542,0 -18.83333,8.42792 -18.83333,18.83333v113c0,10.40542 8.42792,18.83333 18.83333,18.83333h150.66667c10.40542,0 18.83333,-8.42792 18.83333,-18.83333v-113c0,-10.40542 -8.42792,-18.83333 -18.83333,-18.83333zM188.33333,75.33333l-75.33333,47.08333l-75.33333,-47.08333v-18.83333l75.33333,47.08333l75.33333,-47.08333z"></path></g></g>
    </svg>).html_safe
  end

  def magnifier_icon(size)
    %(<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
      width="#{size}" height="#{size}"
      viewBox="0 0 226 226"
      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
      stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray=""
      stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none"
      style="mix-blend-mode: normal"><path d="M0,226v-226h226v226z" fill="none"></path>
      <g fill="#3a6e97"><path d="M84.75,18.83333c-36.29323,0 -65.91667,29.62343 -65.91667,65.91667c0,36.29324 29.62343,65.91667 65.91667,65.91667c16.46031,0 31.49883,-6.13944 43.0739,-16.1849l4.00944,4.00944v12.17546l56.5,56.5l18.83333,-18.83333l-56.5,-56.5h-12.17546l-4.00944,-4.00944c10.04546,-11.57506 16.1849,-26.61358 16.1849,-43.0739c0,-36.29323 -29.62343,-65.91667 -65.91667,-65.91667zM84.75,37.66667c26.11494,0 47.08333,20.96839 47.08333,47.08333c0,26.11494 -20.96839,47.08333 -47.08333,47.08333c-26.11494,0 -47.08333,-20.96839 -47.08333,-47.08333c0,-26.11494 20.96839,-47.08333 47.08333,-47.08333z"></path></g></g>
    </svg>).html_safe
  end

  def gear_icon(size)
    %(<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
      width="#{size}" height="#{size}"
      viewBox="0 0 226 226"
      style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1"
      stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray=""
      stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none"
      style="mix-blend-mode: normal"><path d="M0,226v-226h226v226z" fill="none"></path>
      <g fill="#3a6e97"><path d="M107.57438,18.83333c-2.29767,0 -4.27648,1.66646 -4.65315,3.93587l-2.66684,16.05615c-4.58354,0.78789 -9.01465,2.00603 -13.27897,3.58643l-10.37305,-12.58008c-1.45958,-1.77975 -3.99943,-2.24337 -5.99577,-1.08512l-9.37988,5.42562c-1.99633,1.14883 -2.86973,3.57289 -2.0599,5.71989l5.7015,15.22852c-3.53534,2.94629 -6.80143,6.21239 -9.74772,9.74772l-15.22852,-5.7015c-2.147,-0.80983 -4.57106,0.06356 -5.71989,2.0599l-5.42562,9.37988c-1.15825,1.99633 -0.69463,4.53618 1.08512,5.99577l12.58008,10.37305c-1.58039,4.26432 -2.79854,8.69542 -3.58643,13.27897l-16.05615,2.66684c-2.26942,0.38608 -3.93587,2.34607 -3.93587,4.65315v10.85124c0,2.29767 1.66646,4.27648 3.93587,4.65315l16.05615,2.66684c0.78789,4.58354 2.00603,9.01465 3.58643,13.27897l-12.58008,10.37304c-1.77975,1.45958 -2.23396,3.99944 -1.08512,5.99577l5.42562,9.37989c1.14883,1.99633 3.57289,2.86973 5.71989,2.0599l15.22852,-5.7015c2.94629,3.53534 6.21239,6.80143 9.74772,9.74772l-5.7015,15.22852c-0.80983,2.15642 0.07298,4.57106 2.0599,5.71989l9.37988,5.42562c1.99633,1.14883 4.53618,0.6852 5.99577,-1.08513l10.35466,-12.58007c4.26926,1.58334 8.70802,2.79754 13.29736,3.58642l2.66684,16.05615c0.38608,2.26942 2.34607,3.93587 4.65315,3.93587h10.85124c2.29767,0 4.27648,-1.66646 4.65315,-3.93587l2.66684,-16.05615c4.58354,-0.78789 9.01465,-2.00603 13.27897,-3.58642l10.37304,12.58007c1.45958,1.77975 3.99944,2.23396 5.99577,1.08513l9.37989,-5.42562c1.99633,-1.14883 2.86973,-3.57289 2.0599,-5.71989l-5.7015,-15.22852c3.53534,-2.94629 6.80143,-6.21238 9.74772,-9.74772l15.22852,5.7015c2.15642,0.80983 4.57106,-0.07298 5.71989,-2.0599l5.42562,-9.37989c1.14883,-1.99633 0.6852,-4.53619 -1.08513,-5.99577l-12.58007,-10.35465c1.58334,-4.26926 2.79754,-8.70802 3.58642,-13.29736l16.05615,-2.66684c2.26942,-0.38608 3.93587,-2.34607 3.93587,-4.65315v-10.85124c0,-2.29767 -1.66646,-4.27648 -3.93587,-4.65315l-16.05615,-2.66684c-0.78789,-4.58354 -2.00603,-9.01465 -3.58642,-13.27897l12.58007,-10.37305c1.77975,-1.45958 2.23396,-3.99943 1.08513,-5.99577l-5.42562,-9.37988c-1.14883,-1.99633 -3.57289,-2.86973 -5.71989,-2.0599l-15.22852,5.7015c-2.94629,-3.53534 -6.21238,-6.80143 -9.74772,-9.74772l5.7015,-15.22852c0.80983,-2.15642 -0.07298,-4.57106 -2.0599,-5.71989l-9.37989,-5.42562c-1.99633,-1.14883 -4.53619,-0.68521 -5.99577,1.08512l-10.35465,12.58008c-4.26926,-1.58334 -8.70802,-2.79754 -13.29736,-3.58643l-2.66684,-16.05615c-0.38608,-2.26942 -2.34607,-3.93587 -4.65315,-3.93587zM103.58333,57.34603v29.04085c-11.27984,3.98802 -18.82434,14.64904 -18.83333,26.61312c0.00047,1.73373 0.16054,3.46374 0.47819,5.16813l-25.16016,14.51123c-2.26636,-6.13035 -3.56803,-12.7394 -3.56803,-19.67936c0,-28.09799 20.29632,-51.19089 47.08333,-55.65397zM122.41667,57.34603c26.78702,4.46308 47.08333,27.55598 47.08333,55.65397c0,6.94832 -1.31485,13.56125 -3.58642,19.69776l-25.16016,-14.54802c0.32269,-1.69778 0.48892,-3.42158 0.49658,-5.14974c-0.01678,-11.95732 -7.55985,-22.60896 -18.83333,-26.59473zM131.33675,134.44499l25.25211,14.5848c-10.34438,12.52276 -25.99265,20.47021 -43.58886,20.47021c-17.59622,0 -33.24448,-7.94745 -43.58887,-20.47021l25.23372,-14.56641c5.1144,4.37683 11.6236,6.78354 18.35515,6.78662c6.72755,-0.01258 13.22977,-2.42564 18.33675,-6.80501z"></path></g></g>
    </svg>).html_safe
  end
end
