Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C640258194D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 26 Jul 2022 20:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C535A96EA5;
	Tue, 26 Jul 2022 18:04:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F1496E9C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Jul 2022 18:04:36 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QHDoB9031422;
 Tue, 26 Jul 2022 18:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ieTag46EF2a1y3ONSFB+R6UbnY+B4XHu7AaqRFiMjtg=;
 b=J4Ck2ju2JzM7Sh4CPpLDsikyw3MA57kIeq/mDkt7a2Uj2shqxpRRTywi2TnYlTQL/pQD
 eS0rAq64zEXIC1g8/fNw4+u+0np6XXvLLb133PRmhSmIuehiTnFhtsq628ng21yZuGUK
 OJwsU60eHpqEsangj58+uNiIW8/A998G841td7WutdfFVAGPmmGw7qDxvz+TE/6ZUrzm
 Kj6rABksAVJKqDbIr4zFJXo8t+E/CrQ9BppYA4PxSQ6aC8NxOWaY3cvQn3ZrW6+s2nYq
 5fRnaRSaJZvJpAwOSIQ1FgZ+yzniuv+gipuajjqhJZznzoOu20oiHcaJfAJVIAoj1BsH Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjmfx9pvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 18:03:32 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QHExQn003129;
 Tue, 26 Jul 2022 18:03:32 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjmfx9pv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 18:03:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26QHaXp5010173;
 Tue, 26 Jul 2022 18:03:31 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3hg94am7eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 18:03:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26QI3Uoc38535572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 18:03:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D51D6E054;
 Tue, 26 Jul 2022 18:03:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FF536E052;
 Tue, 26 Jul 2022 18:03:28 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.142.12])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 18:03:28 +0000 (GMT)
Message-ID: <d23d6ef67bb709cbde3886ea24d528c3036bff9b.camel@linux.ibm.com>
Subject: Re: [RFC PATCH] vfio/ccw: Move mdev stuff out of struct subchannel
From: Eric Farman <farman@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 26 Jul 2022 14:03:28 -0400
In-Reply-To: <20220726174817.GB14002@lst.de>
References: <20220720050629.GA6076@lst.de>
 <20220726153725.2573294-1-farman@linux.ibm.com>
 <20220726174817.GB14002@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hlKyD_5yBzGTE-8AXCI9UIfOgJ7I2E8A
X-Proofpoint-ORIG-GUID: QnNDmIJl4isKDRb9DTYRVmPjsuwGe6d3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_05,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=459
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207260069
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, mjrosato@linux.ibm.com,
 kvm@vger.kernel.org, linux-s390@vger.kernel.org, kwankhede@nvidia.com,
 vneethv@linux.ibm.com, pasic@linux.ibm.com, alex.williamson@redhat.com,
 zhenyuw@linux.intel.com, jgg@nvidia.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2022-07-26 at 19:48 +0200, Christoph Hellwig wrote:
> On Tue, Jul 26, 2022 at 05:37:25PM +0200, Eric Farman wrote:
> > Here's my swipe at a cleanup patch that can be folded in
> > to this series, to get the mdev stuff in a more proper
> > location for vfio-ccw.
> > 
> > As previously described, the subchannel is a device-agnostic
> > structure that does/should not need to know about specific
> > nuances such as mediated devices. This is why things like
> > struct vfio_ccw_private exist, so move these details there.
> 
> Should I resend the series with that folded in?  

That would be great. I'll give it another spin and can look over the
ccw changes without the smattering of fixups I have.

> At this point we're
> probably not talking about 5.20 anyway.

