import 'package:flutter/material.dart';
import 'package:simustock/src/ui/signup.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Privacy Policy \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last updated: January 21, 2021",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This Privacy Policy describes Our policies and procedures on the collection,"
                      " use and disclosure of Your information when You use the Service and tells You"
                      " about Your privacy rights and how the law protects You.",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We use Your Personal data to provide and improve the Service. By using the"
                      " Service, You agree to the collection and use of information in accordance with"
                      " this Privacy Policy. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Interpretation and Definitions \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Interpretation",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The words of which the initial letter is capitalized have meanings defined"
                      " under the following conditions. The following definitions shall have the same"
                      " meaning regardless of whether they appear in singular or in plural.\n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Definitions",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "For the purposes of this Privacy Policy: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Account means a unique account created for You to access our Service or"
                        " parts of our Service. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Affiliate means an entity that controls, is controlled by or is under"
                        " common control with a party, where \"control\" means ownership of 50% or"
                        " more of the shares, equity interest or other securities entitled to vote"
                        " for election of directors or other managing authority. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Application means the software program provided by the Company downloaded"
                        " by You on any electronic device, named SimuStock. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this"
                        " by You on any electronic device, named SimuStock. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Country refers to: Idaho, United States \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Device means any device that can access the Service such as a computer, a"
                        " cellphone or a digital tablet. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Personal Data is any information that relates to an identified or"
                        " identifiable individual. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Service refers to the Application. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Service Provider means any natural or legal person who processes the data"
                        " on behalf of the Company. It refers to third-party companies or"
                        " individuals employed by the Company to facilitate the Service, to provide"
                        " the Service on behalf of the Company, to perform services related to the"
                        " Service or to assist the Company in analyzing how the Service is used. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Third-party Social Media Service refers to any website or any social"
                        " network website through which a User can log in or create an account to"
                        " use the Service. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Usage Data refers to data collected automatically, either generated by the"
                        " use of the Service or from the Service infrastructure itself (for example,"
                        " the duration of a page visit). \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "You means the individual accessing or using the Service, or the company,"
                        " or other legal entity on behalf of which such individual is accessing or"
                        " using the Service, as applicable. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Collecting and Using Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Types of Data Collected \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "While using Our Service, We may ask You to provide Us with certain personally"
                      " identifiable information that can be used to contact or identify You."
                      " Personally identifiable information may include, but is not limited to: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Email address \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "First name and last name \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Address, State, Province, ZIP/Postal code, City \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Usage Data \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Usage Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Usage Data is collected automatically when using the Service.",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Usage Data may include information such as Your Device's Internet Protocol"
                      " address (e.g. IP address), browser type, browser version, the pages of our"
                      " Service that You visit, the time and date of Your visit, the time spent on"
                      " those pages, unique device identifiers and other diagnostic data.",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "When You access the Service by or through a mobile device, We may collect"
                      " certain information automatically, including, but not limited to, the type of"
                      " mobile device You use, Your mobile device unique ID, the IP address of Your"
                      " mobile device, Your mobile operating system, the type of mobile Internet"
                      " browser You use, unique device identifiers and other diagnostic data.",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We may also collect information that Your browser sends whenever You visit our"
                      " Service or when You access the Service by or through a mobile device. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Use of Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "The Company may use Personal Data for the following purposes: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "To provide and maintain our Service , including to monitor the usage of"
                        " our Service. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "To manage Your Account: to manage Your registration as a user of the"
                        " Service. The Personal Data You provide can give You access to different"
                        " functionalities of the Service that are available to You as a registered"
                        " user. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "For the performance of a contract: the development, compliance and"
                        " undertaking of the purchase contract for the products, items or services"
                        " You have purchased or of any other contract with Us through the Service. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "To contact You: To contact You by email, telephone calls, SMS, or other"
                        " equivalent forms of electronic communication, such as a mobile"
                        " application's push notifications regarding updates or informative"
                        " communications related to the functionalities, products or contracted"
                        " services, including the security updates, when necessary or reasonable for"
                        " their implementation. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "To provide You with news, special offers and general information about"
                        " other goods, services and events which we offer that are similar to those"
                        " that you have already purchased or enquired about unless You have opted"
                        " not to receive such information. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "To manage Your requests: To attend and manage Your requests to Us. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "For business transfers: We may use Your information to evaluate or conduct"
                        " a merger, divestiture, restructuring, reorganization, dissolution, or"
                        " other sale or transfer of some or all of Our assets, whether as a going"
                        " concern or as part of bankruptcy, liquidation, or similar proceeding, in"
                        " which Personal Data held by Us about our Service users is among the assets"
                        " transferred. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "For other purposes : We may use Your information for other purposes, such"
                        " as data analysis, identifying usage trends, determining the effectiveness"
                        " of our promotional campaigns and to evaluate and improve our Service,"
                        " products, services, marketing and your experience. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Text(
                      "We may share Your personal information in the following situations: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "With Service Providers: We may share Your personal information with"
                        " Service Providers to monitor and analyze the use of our Service, to"
                        " contact You. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "For business transfers: We may share or transfer Your personal information"
                        " in connection with, or during negotiations of, any merger, sale of Company"
                        " assets, financing, or acquisition of all or a portion of Our business to"
                        " another company. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "With Affiliates: We may share Your information with Our affiliates, in"
                        " which case we will require those affiliates to honor this Privacy Policy."
                        " venture partners or other companies that We control or that are under"
                        " common control with Us. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "With business partners: We may share Your information with Our business"
                        " partners to offer You certain products, services or promotions. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "With other users: when You share personal information or otherwise"
                        " interact in the public areas with other users, such information may be"
                        " viewed by all users and may be publicly distributed outside. If You"
                        " interact with other users or register through a Third-Party Social Media"
                        " Service, Your contacts on the Third-Party Social Media Service may see"
                        " Your name, profile, pictures and description of Your activity. Similarly,"
                        " other users will be able to view descriptions of Your activity,"
                        " communicate with You and view Your profile. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "With Your consent : We may disclose Your personal information for any"
                        " other purpose with Your consent. \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Retention of Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Company will retain Your Personal Data only for as long as is necessary"
                      " for the purposes set out in this Privacy Policy. We will retain and use Your"
                      " Personal Data to the extent necessary to comply with our legal obligations"
                      " (for example, if we are required to retain your data to comply with applicable"
                      " laws), resolve disputes, and enforce our legal agreements and policies.",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Company will also retain Usage Data for internal analysis purposes. Usage"
                      " Data is generally retained for a shorter period of time, except when this data"
                      " is used to strengthen the security or to improve the functionality of Our"
                      " Service, or We are legally obligated to retain this data for longer time"
                      " periods. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Transfer of Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your information, including Personal Data, is processed at the Company's"
                      " operating offices and in any other places where the parties involved in the"
                      " processing are located. It means that this information may be transferred to —"
                      " and maintained on — computers located outside of Your state, province, country"
                      " or other governmental jurisdiction where the data protection laws may differ"
                      " than those from Your jurisdiction. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your consent to this Privacy Policy followed by Your submission of such"
                      " information represents Your agreement to that transfer. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Company will take all steps reasonably necessary to ensure that Your data"
                      " is treated securely and in accordance with this Privacy Policy and no transfer"
                      " of Your Personal Data will take place to an organization or a country unless"
                      " there are adequate controls in place including the security of Your data and"
                      " other personal information. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Disclosure of Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Business Transactions \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "If the Company is involved in a merger, acquisition or asset sale, Your"
                      " Personal Data may be transferred. We will provide notice before Your Personal"
                      " Data is transferred and becomes subject to a different Privacy Policy. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Law enforcement \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Under certain circumstances, the Company may be required to disclose Your"
                      " Personal Data if required to do so by law or in response to valid requests by"
                      " public authorities (e.g. a court or a government agency). \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Other legal requirements \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Company may disclose Your Personal Data in the good faith belief that such"
                      " action is necessary to: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Comply with a legal obligation \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Protect and defend the rights or property of the Company \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Prevent or investigate possible wrongdoing in connection with the Service \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Protect the personal safety of Users of the Service or the public \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Protect against legal liability \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Security of Your Personal Data \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The security of Your Personal Data is important to Us, but remember that no"
                      " method of transmission over the Internet, or method of electronic storage is"
                      " 100% secure. While We strive to use commercially acceptable means to protect"
                      " Your Personal Data, We cannot guarantee its absolute security. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Links to Other Websites \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Our Service may contain links to other websites that are not operated by Us."
                      " If You click on a third party link, You will be directed to that third party's"
                      " site. We strongly advise You to review the Privacy Policy of every site You"
                      " visit. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We have no control over and assume no responsibility for the content, privacy"
                      " policies or practices of any third party sites or services. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Changes to this Privacy Policy \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We may update Our Privacy Policy from time to time. We will notify You of any"
                      " changes by posting the new Privacy Policy on this page. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We will let You know via email and/or a prominent notice on Our Service, prior"
                      " to the change becoming effective and update the \"Last updated\" date at the top"
                      " of this Privacy Policy. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You are advised to review this Privacy Policy periodically for any changes."
                      " Changes to this Privacy Policy are effective when they are posted on this"
                      " page. \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Contact Us \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "If you have any questions about this Privacy Policy, You can contact us: \n",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "By email: simustock.app@gmail.com \n",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 100,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                      "By processing you also agree to the Privacy Policy",
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  InkWell(
                    borderRadius: new BorderRadius.circular(15.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupForm(),
                        ),
                      );
                    },
                    child: Container(
                      height: kToolbarHeight / 1.20,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: new Align(
                        alignment: Alignment.center,
                        child: new RichText(
                          text: new TextSpan(
                              style: new TextStyle(
                                fontSize: 13.0,
                                color: Color.fromRGBO(61, 131, 225, 1),
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: 'Don`t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                new TextSpan(
                                  text: ' Sign Up',
                                  style: new TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
