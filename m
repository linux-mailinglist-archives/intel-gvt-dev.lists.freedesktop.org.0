Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7334157A47D
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 19 Jul 2022 19:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9A59061A;
	Tue, 19 Jul 2022 17:03:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44A90635
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Jul 2022 17:03:17 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JGvB00025197;
 Tue, 19 Jul 2022 17:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : reply-to : subject : to : cc : references : from :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=YSJBoYtDEBMmGmrJBygjYcwgGLTznv+EA65ElyKxPKc=;
 b=jDy6Q3n/Gb8B+x15Le/PZUFFF2tzxtnmf0BaQzFHIYhLhrGHtivS/aBcc6XCRsGEwv0u
 Hhis1C3xBN0lHmGMTvPzR8Ca9m+jRSbXcwVEyCOF8v8opRELiLNQUg7ltTEzwIto8pSn
 +i6SjqiWiBWSGLcxWGo6F6mNmyqd7aMDAjS5apYlYzbY08wzb2r94TsY3Xa2EPZwdo7f
 SrkQGSC5ZfZJMi85eyB85XtyuC3xeJKr2iFY9L6T2x+4LW9u7LDoRvW/a45+aGoYRnmR
 O7Me9weEg6D8IwauDSy9IbKuMaxwFjdGY/Sj9L7q5fUyMPpc3h3DMh68Nlp27NHZIDkQ uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3he0k886rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:03:04 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26JH0tJc020517;
 Tue, 19 Jul 2022 17:03:03 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3he0k886r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:03:03 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26JGokBD019670;
 Tue, 19 Jul 2022 17:03:02 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3hbmy9mhfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:03:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26JH31gu33096158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jul 2022 17:03:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A370F6A047;
 Tue, 19 Jul 2022 17:03:01 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9612F6A051;
 Tue, 19 Jul 2022 17:03:00 +0000 (GMT)
Received: from [9.60.75.252] (unknown [9.60.75.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jul 2022 17:03:00 +0000 (GMT)
Message-ID: <f6fe262c-ca07-97e2-ce15-ebcce5ded359@linux.ibm.com>
Date: Tue, 19 Jul 2022 13:03:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/14] vfio/mdev: make mdev.h standalone includable
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20220709045450.609884-1-hch@lst.de>
 <20220709045450.609884-4-hch@lst.de>
From: "Jason J. Herne" <jjherne@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220709045450.609884-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VkXZEm0apAHqu2qzYQx1cpOPxW0i9zxa
X-Proofpoint-GUID: 6T6S-zSBqaS8K2eKqOZegKWdkyfOO4y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_04,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 clxscore=1011 phishscore=0 mlxlogscore=913
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207190069
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
Reply-To: jjherne@linux.ibm.com
Cc: linux-s390@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On 7/9/22 00:54, Christoph Hellwig wrote:
> Include <linux/device.h> and <linux/uuid.h> so that users of this headers
> don't need to do that and remove those includes that aren't needed
> any more.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed By: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>   drivers/gpu/drm/i915/gvt/kvmgt.c      | 2 --
>   drivers/s390/cio/vfio_ccw_drv.c       | 1 -
>   drivers/s390/crypto/vfio_ap_private.h | 1 -
>   drivers/vfio/mdev/mdev_core.c         | 2 --
>   drivers/vfio/mdev/mdev_driver.c       | 1 -
>   drivers/vfio/mdev/mdev_sysfs.c        | 2 --
>   include/linux/mdev.h                  | 3 +++
>   samples/vfio-mdev/mbochs.c            | 1 -
>   samples/vfio-mdev/mdpy.c              | 1 -
>   samples/vfio-mdev/mtty.c              | 2 --
>   10 files changed, 3 insertions(+), 13 deletions(-)
> 
 > ...
> diff --git a/drivers/s390/crypto/vfio_ap_private.h b/drivers/s390/crypto/vfio_ap_private.h
> index a26efd804d0df..6616aa83347ad 100644
> --- a/drivers/s390/crypto/vfio_ap_private.h
> +++ b/drivers/s390/crypto/vfio_ap_private.h
> @@ -13,7 +13,6 @@
>   #define _VFIO_AP_PRIVATE_H_
>   
>   #include <linux/types.h>
> -#include <linux/device.h>
>   #include <linux/mdev.h>
>   #include <linux/delay.h>
>   #include <linux/mutex.h>

Signed-off-by: Jason J. Herne <jjherne@linux.ibm.com>



-- 
-- Jason J. Herne (jjherne@linux.ibm.com)
