import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MedicaminaDashSettingsOpenSourceLicenseWidget extends StatefulWidget {
  const MedicaminaDashSettingsOpenSourceLicenseWidget({super.key});

  @override
  State<MedicaminaDashSettingsOpenSourceLicenseWidget> createState() => _MedicaminaDashSettingsOpenSourceLicenseWidgetState();
}

class _MedicaminaDashSettingsOpenSourceLicenseWidgetState extends State<MedicaminaDashSettingsOpenSourceLicenseWidget> {
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      platform: DevicePlatform.iOS,
      darkTheme: const SettingsThemeData(
        settingsListBackground: Color.fromARGB(255, 48, 48, 48),
        settingsSectionBackground: Color.fromARGB(255, 66, 66, 66),
      ),
      sections: [
        SettingsSection(
          tiles: [
            SettingsTile(
            title: RichText(
              text: TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: 'LIMITED USE SOFTWARE LICENSE AGREEMENT\n\n'),
                  TextSpan(text: 'Copyright (c) 2022 Medicamina\n\n', style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: 'This Limited Use Software License Agreement (the "Agreement") is a legal agreement between you, the end-user, and medicamina.\n\n'),
                  TextSpan(text: 'BY CONTINUING THE INSTALLATION OF THIS SOFTWARE, BY LOADING OR RUNNING THE SOFTWARE, OR BY PLACING OR COPYING THE SOFTWARE ONTO YOUR COMPUTER HARD DRIVE, COMPUTER RAM OR OTHER STORAGE, YOU ARE AGREEING TO BE BOUND BY THE TERMS OF THIS AGREEMENT.\n\n', style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(text: 'Medicamina is licensed to You (End-User) by Medicamina, for use only under the terms of this Licence Agreement.\n\n'),
                  TextSpan(text: 'The Licensed Application is not tailored to comply with industry-specific regulations of each jurisdiction, so if your interactions would be in violation to such laws you may not use this Licensed Application.\n\n'),
                  TextSpan(text: '1. ', children: [TextSpan(text: 'Grant of License\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - Subject to the terms and provisions of this Agreement, medicamina grants to you the non-exclusive and limited right to use the Software only in executable or object code form. The term "Software" includes all elements of the Software, including, without limitation, data files and screen displays. You are not receiving any ownership or proprietary right, title or interest in or to the Software or the copyright, trademarks, or other rights related thereto. For purposes of this section, "use" means loading the Software into RAM and/or onto computer hard drive, as well as installation of the Software on a hard disk or other storage device and means the uses permitted in section 3. hereinbelow. You agree that the Software will not be shipped, transferred or exported into any country in violation of any law governing such matters by you or anyone at your direction and that you will not utilize and will not authorize anyone to utilize, in any other manner, the Software in violation of any applicable law. The Software may not be downloaded or otherwise exported or exported into (or to a national or resident of) any country or to anyone or into any country who/which are prohibited, by applicable law, from receiving such property.\n'),
                  TextSpan(text: '  - You are given a non-transferable, non-exclusive, non-sublicensable licence to install and use the Licensed Application on any Devices that You (End-User) own or control and as permitted by this Agreement.\n'),
                  TextSpan(text: '  - This licence will also govern any updates of the Licensed Application provided by Licensor that replace, repair, and/or supplement the first Licensed Application, unless a separate licence is provided for such update, in which case the terms of that new licence will govern.\n\n'),
                  TextSpan(text: '2. ', children: [TextSpan(text: 'Prohibitions\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - You, either directly or indirectly, shall not do any of the following acts:\n'),
                  TextSpan(text: '    1. rent the Software;\n'),
                  TextSpan(text: '    2. sell the Software;\n'),
                  TextSpan(text: '    3. lease or lend the Software;\n'),
                  TextSpan(text: '    4. redistribute the Software (except as permitted by section 3. hereinbelow);\n'),
                  TextSpan(text: '    5. commercially exploit the Software;\n'),
                  TextSpan(text: '    6. disassemble, reverse engineer, decompile, modify, or alter the Software for commerical purposes, excluding for the purpose bug bounties and proof of concept feature examples as part of user experience feedback (comprehensive of section 9. hereinbelow);\n'),
                  TextSpan(text: '    7. translate the Software excluding for collaboration with the prior authorisation of medicamina;\n'),
                  TextSpan(text: '    8. reproduce or copy the Software (except as permitted by section 3. hereinbelow);\n'),
                  TextSpan(text: '    9. publicly display the Software excluding for reviewing, education or as a media prop;\n'),
                  TextSpan(text: '    10. prepare or develop derivative works and updates based upon the Software; or\n'),
                  TextSpan(text: '    11. remove or alter any legal notices or other markings or legends, such as trademark and copyright notices, affixed on or within the Software.\n\n'),
                  TextSpan(text: '3.', children: [TextSpan(text: ' Permitted Distribution and Copying\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - So long as this Agreement accompanies each copy you make of the Software, and so long as you fully comply, at all times, with this Agreement, medicamina grants to you the non-exclusive and limited right to copy the Software and to distribute such copies of the Software free of charge for non-commercial purposes which shall include the free of charge distribution of copies of the Software provided, however, you shall not copy or distribute the Software in any infringing manner or in any manner which violates any law or third party right and you shall not distribute the Software together with any material which is infringing, libelous, defamatory, obscene, false, misleading, or otherwise illegal or unlawful. Medicamina reserves all rights not granted in this Agreement. You shall not commercially distribute the Software unless you first enter into a separate contract with medicamina, a copy of which you may request, but which medicamina may decline to execute.\n\n'),
                  TextSpan(text: '4.', children: [TextSpan(text: ' Intellectual Property Rights\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - The Software and all copyrights, trademarks and all other conceivable intellectual property rights related to the software are owned by medicamina and are protected by copyright laws, international treaty provisions and all applicable law. You must treat the Software like any other copyrighted material. You agree to use your best efforts to see that any user of the Software licensed hereunder complies with this Agreement. You agree that you are receiving a copy of the Software by license only and not by sale.\n\n'),
                  TextSpan(text: '5.', children: [TextSpan(text: ' NO WARRANTIES\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - MEDICAMINA DISCLAIMS ALL WARRANTIES, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE WITH RESPECT TO THE SOFTWARE. MEDICAMINA DOES NOT WARRANT THAT THE OPERATION OF THE SOFTWARE WILL BE UNINTERRUPTED OR ERROR FREE OR THAT THE SOFTWARE WILL MEET YOUR SPECIFIC REQUIREMENTS. ADDITIONAL STATEMENTS SUCH AS PRESENTATIONS, WHETHER ORAL OR WRITTEN, DO NOT CONSTITUTE WARRANTIES BY MEDICAMINA AND SHOULD NOT BE RELIED UPON. THIS SECTION 5. SHALL SURVIVE CANCELLATION OR TERMINATION OF THIS AGREEMENT.\n\n'),
                  TextSpan(text: '6.', children: [TextSpan(text: ' Governing Law, Venue, Indemnity and Liability Limitation\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - This Agreement shall be construed in accordance with and governed by the applicable state and federal law. Copyright and other proprietary matters will be governed by laws and international treaties. You agree to indemnify, defend and hold harmless medicamina and medicamina\'s officers, employees, directors, agents, licensees (excluding you), successors and assigns from and against all losses, lawsuits, damages, causes of action and claims relating to and/or arising from your breach of this Agreement. You agree that your unauthorized use of the Software, or any part thereof, may immediately and irreparably damage medicamina such that medicamina could not be adequately compensated solely by a monetary award and that at medicamina\'s option medicamina shall be entitled to an injunctive order, in addition to all other available remedies including a monetary award, appropriately restraining and/or prohibiting such unauthorized use without the necessity of medicamina posting bond or other security. IN ANY CASE, MEDCIAMINA AND MEDCIAMINA\'S OFFICERS, EMPLOYEES, DIRECTORS, AGENTS, LICENSEES, SUBLICENSEES, SUCCESSORS AND ASSIGNS SHALL NOT BE LIABLE FOR LOSS OF DATA, LOSS OF PROFITS, LOST SAVINGS, SPECIAL, INCIDENTAL, CONSEQUENTIAL, INDIRECT, PUNITIVE OR OTHER SIMILAR DAMAGES ARISING FROM ANY ALLEGED CLAIM FOR BREACH OF WARRANTY, BREACH OF CONTRACT, NEGLIGENCE, STRICT PRODUCT LIABILITY, OR OTHER LEGAL THEORY EVEN IF MEDCIAMINA OR ITS AGENT HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR EVEN IF SUCH DAMAGES ARE FORESEEABLE, OR LIABLE FOR ANY CLAIM BY ANY OTHER PARTY. Some jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation or exclusion may not apply to you. This Section 7. shall survive cancellation or termination of this Agreement.\n\n'),
                  TextSpan(text: '7.', children: [TextSpan(text: ' General Provisions\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - Neither this Agreement nor any part or portion hereof shall be assigned or sublicensed by you. medicamina may assign its rights under this Agreement in medicamina\'s sole discretion. Should any provision of this Agreement be held to be void, invalid, unenforceable or illegal by a court of competent jurisdiction, the validity and enforceability of the other provisions shall not be affected thereby. If any provision is determined to be unenforceable by a court of competent jurisdiction, you agree to a modification of such provision to provide for enforcement of the provision\'s intent, to the extent permitted by applicable law. Failure of medicamina to enforce any provision of this Agreement shall not constitute or be construed as a waiver of such provision or of the right to enforce such provision. Immediately upon your failure to comply with or breach of any term or provision of this Agreement, THIS AGREEMENT AND YOUR LICENSE SHALL AUTOMATICALLY TERMINATE, WITHOUT NOTICE, AND MEDICAMINA MAY PURSUE ALL RELIEF AND REMEDIES AGAINST YOU WHICH ARE AVAILABLE UNDER APPLICABLE LAW AND/OR THIS AGREEMENT. In the event this Agreement is terminated, you shall have no right to use the Software, in any manner, and you shall immediately destroy all copies of the Software in your possession, custody or control.\n\n'),
                  TextSpan(text: '8.', children: [TextSpan(text: ' Maintenance and Support\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - Obtaining a copy of medicamina\'s source code does not entitle you to any support, maintenance or ongoing Software updates. Online support documentation for medicamina will be provided to the public prior to the purchasing of any Software upgrades. Medicamina reserve the right to discontinue Software support and updates for any device and firmware version for hardware devices at any time and ongoing updates will be provided to selected appropriate devices and web browsers. Maintenance and support will be available to the end-user for the Software if the end-user is current on all payments with medicamina and the end-user is running a currently supported version(s) of the Software. Medicamina shall provide limited Software technical support services to free customer accounts and general enquiries.\n\n'),
                  TextSpan(text: '9.', children: [TextSpan(text: ' Community generated contributions\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - Medicamina may invite you to chat, contribute to, or participate in blogs, message boards, online forums, and other functionality, and may provide you with the opportunity to create, submit, post, display, transmit, perform, publish, distribute, or broadcast content and materials to us or in the Licensed Application, including but not limited to text, writings, video, audio, photographs, graphics, comments, suggestions, or personal information or other material (collectively, \'Contributions\'). Contributions may be viewable by other users of the Licensed Application and through third-party websites or applications. As such, any Contributions you transmit may be treated as non-confidential and non-proprietary. When you create or make available any Contributions, you thereby represent and warrant that:\n'),
                  TextSpan(text: '    1. The creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your Contributions do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party.\n'),
                  TextSpan(text: '    2. You are the creator and owner of or have the necessary licences, rights, consents, releases, and permissions to use and to authorise us, the Licensed Application, and other users of the Licensed Application to use your Contributions in any manner contemplated by the Licensed Application and this Licence Agreement.:\n'),
                  TextSpan(text: '    3. You have the written consent, release, and/or permission of each and every identifiable individual person in your Contributions to use the name or likeness or each and every such identifiable individual person to enable inclusion and use of your Contributions in any manner contemplated by the Licensed Application and this Licence Agreement.\n'),
                  TextSpan(text: '    4. Your Contributions are not false, inaccurate, or misleading.\n'),
                  TextSpan(text: '    5. Your Contributions are not unsolicited or unauthorised advertising, promotional materials, pyramid schemes, chain letters, spam, mass mailings, or other forms of solicitation.\n'),
                  TextSpan(text: '    6. Your Contributions are not obscene, lewd, lascivious, filthy, violent, harassing, libellous, slanderous, or otherwise objectionable (as determined by us).\n'),
                  TextSpan(text: '    7. Your Contributions do not ridicule, mock, disparage, intimidate, or abuse anyone.\n'),
                  TextSpan(text: '    8. Your Contributions are not used to harass or threaten (in the legal sense of those terms) any other person and to promote violence against a specific person or class of people.\n'),
                  TextSpan(text: '    9. Your Contributions do not violate any applicable law, regulation, or rule.\n'),
                  TextSpan(text: '    10. Your Contributions do not violate the privacy or publicity rights of any third party.\n'),
                  TextSpan(text: '    11. Your Contributions do not violate any applicable law concerning child pornography, or otherwise intended to protect the health or well-being of minors. 12. Your Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap.\n'),
                  TextSpan(text: '    12. Your Contributions do not otherwise violate, or link to material that violates, any provision of this Licence Agreement, or any applicable law or regulation.\n'),
                  TextSpan(text: '  - Any use of the Licensed Application in violation of the foregoing violates this Licence Agreement and may result in, among other things, termination or suspension of your rights to use the Licensed Application.\n'),
                  TextSpan(text: '  - By posting your Contributions to any part of the Licensed Application or making Contributions accessible to the Licensed Application by linking your account from the Licensed Application to any of your social networking accounts, you automatically grant, and you represent and warrant that you have the right to grant, to us an unrestricted, unlimited, irrevocable, perpetual, non-exclusive, transferable, royalty-free, fully-paid, worldwide right, and licence to host, use copy, reproduce, disclose, sell, resell, publish, broad cast, retitle, archive, store, cache, publicly display, reformat, translate, transmit, excerpt (in whole or in part), and distribute such Contributions (including, without limitation, your image and voice) for any purpose, commercial advertising, or otherwise, and to prepare derivative works of, or incorporate in other works, such as Contributions, and grant and authorise sublicences of the foregoing. The use and distribution may occur in any media formats and through any media channels.\n'),
                  TextSpan(text: '  - We have the right, in our sole and absolute discretion, (1) to edit, redact, or otherwise change any Contributions; (2) to recategorise any Contributions to place them in more appropriate locations in the Licensed Application; and (3) to prescreen or delete any Contributions at any time and for any reason, without notice. We have no obligation to monitor your Contributions.\n'),
                  TextSpan(text: '  - Community contributors who have bug bounties acknowledged, merge requests accepted and user experience suggestions implemented may have their names recognized as a patron contributor in the products source code, being designated a patron contributor does not grant you the rights to medicamina or it\'s intellectual property and is only a recognition of work completed, work may be compensated for in the form of financial earnings however medicamina reserves the right to grant these provisions on it\'s own determiniation without notice.\n\n'),
                  TextSpan(text: '10.', children: [TextSpan(text: ' Legal compliance\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - You represent and warrant that You are not located in a country that is subject to a US Government embargo, or that has been designated by the US Government as a \'terrorist supporting\' country; and that You are not listed on any US Government list of prohibited or restricted parties.\n\n'),
                  TextSpan(text: '11.', children: [TextSpan(text: ' Applicable law\n', style: TextStyle(fontWeight: FontWeight.bold))]),
                  TextSpan(text: '  - This Licence Agreement is governed by the laws of Australia excluding its conflicts of law rules.\n\n'),
                  TextSpan(text: 'YOU ACKNOWLEDGE THAT YOU HAVE READ THIS AGREEMENT, YOU UNDERSTAND THIS AGREEMENT, AND UNDERSTAND THAT BY CONTINUING THE INSTALLATION OF THE SOFTWARE, BY LOADING OR RUNNING THE SOFTWARE, OR BY PLACING OR COPYING THE SOFTWARE ONTO YOUR COMPUTER HARD DRIVE OR RAM, YOU AGREE TO BE BOUND BY THE TERMS AND CONDITIONS OF THIS AGREEMENT. YOU FURTHER AGREE THAT, EXCEPT FOR WRITTEN SEPARATE AGREEMENTS BETWEEN MEDICAMINA AND YOU, THIS AGREEMENT IS A COMPLETE AND EXCLUSIVE STATEMENT OF THE RIGHTS AND LIABILITIES OF THE PARTIES HERETO. THIS AGREEMENT SUPERSEDES ALL PRIOR ORAL AGREEMENTS, PROPOSALS OR UNDERSTANDINGS, AND ANY OTHER COMMUNICATIONS BETWEEN MEDCIAMINA AND YOU RELATING TO THE SUBJECT MATTER OF THIS AGREEMENT.', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )),
          ],
        ),
        SettingsSection(
          margin: EdgeInsetsDirectional.only(top: 0),
          tiles: [
            CustomSettingsTile(
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 3,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back'),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
