Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A457A5B6
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 19:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0281D11B75B;
	Tue, 19 Jul 2022 17:49:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430B311B75B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 17:49:23 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JHehtO001720;
 Tue, 19 Jul 2022 17:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=xzUze/iiSq+p9wYPO059FoqHveJAoe0olus79HqcPx8=;
 b=RL5PHrf7kH2SJaYyTpXt07wYlPHGPefhrLlJzOELlHeL31wCenNIMy85/uwZJ4dEXAc/
 hrV3zGvDTXXj1m5xBsBbEm7n+V0WgLCa1X5NeGAc0yHSm2UAseIbOBwpSglWE0uYnpOE
 jVnpYz5YMLv+b7aJ9c5a65eaGlu+liP9UYN5G6g535OC5uCygnfQ6JAt7EgbnU6zPT4Z
 Z0opl0RmqLpwQkK5QlnNAqrIS9Iu3Bmei2FBnXwvKOAx+nODGtPw5TAv55hlncu5t8t2
 vCWpK5w6weAZPPEfdH/SGn0BZ+VIUNIF8yAUoXwWdVR1m7hcyP0Pj5EgiLCxZiVrMdU2 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3he17mg969-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:49:21 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JHfne9013059;
 Tue, 19 Jul 2022 17:49:21 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3he17mg94x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:49:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26JHcJUG025193;
 Tue, 19 Jul 2022 17:49:19 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3hbmy9cse3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:49:19 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26JHnJA428508656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:49:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 100552805C;
 Tue, 19 Jul 2022 17:49:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 880A128058;
 Tue, 19 Jul 2022 17:49:15 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.146.30])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jul 2022 17:49:15 +0000 (GMT)
Message-ID: <20cba66846a011e2fe8885f15def6ec837d12d0b.camel@linux.ibm.com>
Subject: Re: simplify the mdev interface v6
From: Eric Farman <farman@linux.ibm.com>
To: Alex Williamson <alex.williamson@redhat.com>, Christoph Hellwig
 <hch@lst.de>
Date: Tue, 19 Jul 2022 13:49:14 -0400
In-Reply-To: <20220719092644.3db1ceee.alex.williamson@redhat.com>
References: <20220709045450.609884-1-hch@lst.de>
 <20220718054348.GA22345@lst.de>
 <20220718153331.18a52e31.alex.williamson@redhat.com>
 <1f945ef0eb6c02079700a6785ca3dd9864096b82.camel@linux.ibm.com>
 <20220719144928.GB21431@lst.de>
 <20220719092644.3db1ceee.alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dn5uPDe8IWbRDzWF36HVjzkxc3_B_8W4
X-Proofpoint-ORIG-GUID: OJ0MsdChTnXlcQ58NXzihtY1bVw0VG-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_06,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190074
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 linux-s390@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Halil Pasic <pasic@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 2022-07-19 at 09:26 -0600, Alex Williamson wrote:
> On Tue, 19 Jul 2022 16:49:28 +0200
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > On Mon, Jul 18, 2022 at 10:01:40PM -0400, Eric Farman wrote:
> > > I'll get the problem with struct subchannel [1] sorted out in the
> > > next
> > > couple of days. This series breaks vfio-ccw in its current form
> > > (see
> > > reply to patch 14), but even with that addressed the placement of
> > > all
> > > these other mdev structs needs to be handled differently.  
> > 
> > Alex, any preference if I should just fix the number instances
> > checking
> > with either an incremental patch or a resend, or wait for this ccw
> > rework?
> 
> Since it's the last patch, let's at least just respin that patch
> rather
> than break and fix.  I'd like to make sure Eric is ok to shift around
> structures as a follow-up or make a proposal how this series should
> change though. 

I'd hoped to have that proposal today, but I don't have much confidence
in it yet as this series (with the fix on the last patch) is still
crashing my system. Will get something out as soon as I'm able.

>  Thanks,
> 
> Alex
> 

